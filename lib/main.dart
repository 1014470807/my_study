import 'package:my_study/common/public.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'dart:io';
import 'package:jverify/jverify.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  fluwx.WeChatScene scene = fluwx.WeChatScene.TIMELINE;
  String _imagePath =
  "http://www.jiabala.com/img/qrcode.jpg";
  String _thumbnail = "http://www.jiabala.com/img/qrcode.jpg";
  String _url = "share text from fluwx";
  String _title = "Fluwx";
  String _thumnail = "http://www.jiabala.com/img/qrcode.jpg";
  String _response = "";
  String _result = "无";
  Jverify jverify = new Jverify();
  @override
  void initState() {
    super.initState();
    //_initFluwx();
    jverify.setDebugMode(true);
    jverify.setup(
        appKey: "f0432ae61bcfd3d38c0b5e0a",
        channel: "devloper-default",
        useIDFA: false
    );
    jverify.checkVerifyEnable().then((map){
      bool result = map["result"];
      if(result){
        // 当前网络环境支持认证
        print('当前网络环境支持认证');
        JVUIConfig uiConfig = JVUIConfig();
        jverify.setCustomAuthorizationView(false, uiConfig, landscapeConfig: uiConfig);
        /// 步骤 2： 添加 loginAuth 接口回调的监听 （如果想通过 loginAuth 接口异步返回获取接口数据，则忽略此步骤）
        jverify.addLoginAuthCallBackListener((event){
          print("通过添加监听，获取到 loginAuth 接口返回数据，code=${event.code},message = ${event.message},operator = ${event.operator}");
        });
//        /// 步骤 3：开始调用一键登录接口
//        jverify.loginAuth(true).then((map){
//          /// 步骤 4：获取 loginAuth 接口异步返回数据（如果是通过添加 JVLoginAuthCallBackListener 监听来获取返回数据，则忽略此步骤）
//          // print("通过接口异步返回，获取到 loginAuth 接口返回数据，code=$code,message = $content,operator = $operator");
//          print("通过接口异步返回，获取到 loginAuth");
//          print(map);
//        });
//        jverify.getToken().then((map){
//          int _code = map["code"]; // 返回码，2000代表获取成功，其他为失败，详见错误码描述
//          String _token = map["content"]; // 成功时为token，可用于调用验证手机号接口。token有效期为1分钟，超过时效需要重新获取才能使用。失败时为失败信息
//          String _operator = map["operator"]; // 成功时为对应运营商，CM代表中国移动，CU代表中国联通，CT代表中国电信。失败时可能为null
//          print("一键登录 token code: ${_code} 运营商: ${_operator} _token: ${_token}");
//          if(_code == 2000){
//            // 请求后台校验
//          }else{
//            print('没有手机卡，或者异常');
//          }
//        });
      }else{
        // 当前网络环境不支持认证
        print('no~~当前网络环境不支持认证');
      }
    });
  }
//  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
//    return <String, dynamic>{
//      'version.securityPatch': build.version.securityPatch,
//      'version.sdkInt': build.version.sdkInt,
//      'version.release': build.version.release,
//      'version.previewSdkInt': build.version.previewSdkInt,
//      'version.incremental': build.version.incremental,
//      'version.codename': build.version.codename,
//      'version.baseOS': build.version.baseOS,
//      'board': build.board,
//      'bootloader': build.bootloader,
//      'brand': build.brand,
//      'device': build.device,
//      'display': build.display,
//      'fingerprint': build.fingerprint,
//      'hardware': build.hardware,
//      'host': build.host,
//      'id': build.id,
//      'manufacturer': build.manufacturer,
//      'model': build.model,
//      'product': build.product,
//      'supported32BitAbis': build.supported32BitAbis,
//      'supported64BitAbis': build.supported64BitAbis,
//      'supportedAbis': build.supportedAbis,
//      'tags': build.tags,
//      'type': build.type,
//      'isPhysicalDevice': build.isPhysicalDevice
//    };
//  }
  void getDeviceInfo() async{
//    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
//    if(Platform.isIOS){
//      print('IOS设备：');
//      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//    }else if(Platform.isAndroid){
//      print('Android设备');
//      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//      print('Running on ${_readAndroidBuildData(androidInfo).toString()}');  // e.g. "Moto G (4)"
//    }
  }
  void _shareImage() {
//    fluwx
//        .share(fluwx.WeChatShareTextModel(
//        text: "123456",
//        transaction: "text${DateTime.now().millisecondsSinceEpoch}",
//        scene: scene))
//        .then((data) {
//      print(data);
//    });
    var model = fluwx.WeChatShareWebPageModel(
        webPage: _url,
        title: _title,
        thumbnail: _thumnail,
        scene: scene,
        transaction: "hh");
    fluwx.share(model);
  }

  _initFluwx() async {
    await fluwx.registerWxApi(
        appId: "wx732b3814c4c22fcb",
        doOnAndroid: true,
        doOnIOS: true,
        universalLink: "https://your.univerallink.com/link/");
    var result = await fluwx.isWeChatInstalled();
    fluwx.responseFromShare.listen((data) {
      print('这是share数据${data}');
      //print(data.toString());
    });
    fluwx.responseFromAuth.listen((data) {
      print('这是数据${data.code}');
      setState(() {
        _result = "${data.toString()}";
      });
    });
    print("is installed $result");
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          width: 400,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: (){
//                    _shareImage();
                    jverify.loginAuth(true).then((map){
                      /// 步骤 4：获取 loginAuth 接口异步返回数据（如果是通过添加 JVLoginAuthCallBackListener 监听来获取返回数据，则忽略此步骤）
                      // print("通过接口异步返回，获取到 loginAuth 接口返回数据，code=$code,message = $content,operator = $operator");
                      print("通过接口异步返回，获取到 loginAuth");
                      print(map);
                    });

                  },
                  child: Container(
                    width: 700,
                    height: 200,
                    child: Text("分享"),
                  ),
                )
              ),
              OutlineButton(
                onPressed: () {
//                  getDeviceInfo();
//                  var model = fluwx.WeChatShareMusicModel(
//                      title: _title,
//                      description: "这是分享信息",
//                      transaction: "music",
//                      musicUrl: "https://m701.music.126.net/20191207211351/7f106dd8d52b4f7be80a2ddf6aa2f018/jdyyaac/0f5f/055e/0109/8525472193241a22162f6cb49c5d5897.m4a",
//                      scene: fluwx.WeChatScene.TIMELINE,
//                      musicLowBandUrl: "http://www.qq.com",
//                      thumbnail: _thumnail);
//
//                  fluwx.share(model);
                },
                child: const Text("支付"),
              ),
            ],
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
