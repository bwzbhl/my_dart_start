//异步 https://dart.cn/samples#async
import 'dart:io';

void main() {
  test();
}

Future<void> test() async {
  var obj = ['apple', 'pear', 'watermelon', 'strawberry'];

//使用 async 和 await 关键字可以让你避免回调地狱 (Callback Hell) 并使你的代码更具可读性。
  const oneSecond = Duration(seconds: 1);
//...
  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

/* 
Future<void> printWithDelay(String message) {
  //上面的方法也相当于：
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}
 */

  printWithDelay('one second later...');
  print('one');

  printWithDelay('two seconds later...');
  print('two');

  creatDescriptions(obj);

  await Future.delayed(Duration(seconds: 7));
}

Future<void> creatDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot creat description for $object: $e');
    }
  }
}

/**
//也可以使用async*关键字，提供一个可读性更好的方式去生成Stream
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} files by $object';
  }
} 
*/