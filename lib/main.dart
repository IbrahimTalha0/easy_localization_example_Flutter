import 'package:easy_local_packet/constants.dart';
import 'package:easy_local_packet/extensions/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: AppConstant.SUPPORTED_LOCALE,
    child: MyApp(),
    path: AppConstant.LANG_PATH,
    fallbackLocale: AppConstant.TR_LOCALE,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconLanguage(),
      appBar: AppBar(
        title: Text(LocaleKeys.main_title.tr()),
        centerTitle: true,
      ),
      backgroundColor: Colors.orange,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.main_bodyText.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  
                ],
                ),
          ),
        ),
      ),
    );
  }
}

class IconLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.language),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.setLocale(AppConstant.ES_LOCALE);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("es-ES"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.setLocale(AppConstant.EN_LOCALE);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("ENG"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.setLocale(AppConstant.TR_LOCALE);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("TR"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.setLocale(AppConstant.DE_LOCALE);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("DE"),
                              ],
                            )),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        });
  }
}
