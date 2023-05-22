//异常 https://dart.cn/samples#exceptions
import "dart:io";
void main() {
  test();
  print('done!');
}

void test() {
  var flybyObjects = ['Jupiter', 'Saturn'];
  describeFlybyObjects(flybyObjects);
}

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object:$e');
  } finally {
    flybyObjects.clear();
  }
}

/* 
//使用throw关键字抛出一个异常
if (astronauts == 0) {
  throw StateError('No astronauts.');
}
 */