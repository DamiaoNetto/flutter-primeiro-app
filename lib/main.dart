import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Audio',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // ths a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.]
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),

      home: const MyHomePage(title: 'Play Audio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Flag to indicate if a sound is currently playing.
  bool _estaTocando = false;

  void _reproduzirSom(String som) async {
    setState(() {
      _estaTocando = true; // Disable buttons while sound is playing
    });

    final player = AudioPlayer();

    // Play the audio from assets
    await player.play(AssetSource(som));

    // Wait for the audio to finish
    player.onPlayerComplete.listen((event) {
      setState(() {
        _estaTocando = false; // Re-enable buttons after sound ends
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _reproduzirSom method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/planofundo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), // margem lateral
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Escolha um som para reproduzir',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // ajuste conforme o fundo
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: _estaTocando ? null : () => _reproduzirSom("sons/sound1.ogg"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    minimumSize: const Size(double.infinity, 70), // largura máxima e altura fixa
                    iconSize: 60,
                  ),
                  child: const Icon(Icons.play_circle),
                ),

                const SizedBox(height: 30), // Espaço vertical entre os botões

                ElevatedButton(
                  onPressed: _estaTocando ? null : () => _reproduzirSom("sons/sound2.ogg"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    minimumSize: const Size(double.infinity, 70),
                    iconSize: 60,
                  ),
                  child: const Icon(Icons.play_circle),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: _estaTocando ? null : () => _reproduzirSom("sons/sound3.ogg"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    minimumSize: const Size(double.infinity, 70),
                    iconSize: 60,
                  ),
                  child: const Icon(Icons.play_circle),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: _estaTocando ? null : () => _reproduzirSom("sons/sound4.ogg"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    minimumSize: const Size(double.infinity, 70),
                    iconSize: 60,
                  ),
                  child: const Icon(Icons.play_circle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
