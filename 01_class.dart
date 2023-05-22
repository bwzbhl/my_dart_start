void main() {
  //类的使用
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  //扩展类（继承）
  var orbiter = Orbiter('Orbiter I', DateTime(2000, 7, 17), 777);
  orbiter.orbiterDescribe();

  //实现隐式接口
  var mock = MockSpaceship();
  mock.describe();
  print('class');
}

//类class https://dart.cn/samples#classes
class Spacecraft {
  String name;
  DateTime? launchDate;

  //构造函数，设置成员变量
  /*
    Spacecraft(this.name, this.launchDate) {
      //在这里编写初始化代码
      this.name = 'hangkong I';
      this.launchDate = DateTime.now();
    }
    */
  //简化写法
  Spacecraft(this.name, this.launchDate);

  //命名构造函数，最终调用默认构造函数
  Spacecraft.unlaunched(String name) : this(name, null);

  //get 可读
  int? get launchYear => launchDate?.year; // read-only non-final 属性

  //方法
  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate; //少它，l38报错
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//扩展类（继承） https://dart.cn/samples#inheritance
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);

  orbiterDescribe() {
    print('======This is an Orbiter:==========');
    print('name: $name, launchDate: $launchDate');
    print('launched altitude: $altitude');
  }
}

//接口和抽象类 https://dart.cn/samples#interfaces-and-abstract-classes
//Dart没有interface。相反，所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现
class MockSpaceship implements Spacecraft {
  // late 显式声明一个变量，但不初始化
  late String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  void describe() {
    print('================================');
    print('This is an mockSpaceship');
  }
}