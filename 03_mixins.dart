import '01_class.dart';

void main() {
  var pilot = PilotedCraft('spacecraft1', DateTime(2023, 4, 20), 2);
  pilot.describeCrew();

  var turkey = Food();
  turkey.describeWithEmphasis();
}

///Minxin是一种在多个类层次结构中重用代码的方法
//声明一个Mixin
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

//使用 Mixin 的方式继承这个类就可将该类中的功能添加给其它类
class PilotedCraft extends Spacecraft with Piloted {
  //PilotedCraft 类中就包含了 astronauts 字段以及 describeCrew() 方法
  int frequency;

  PilotedCraft(name, DateTime launchDate, this.frequency)
      : super(name, launchDate);
}

///被任意具体类扩展（或实现）的抽象类。抽象类可以包含抽象方法（不含方法体的方法）
abstract class Describable {
  void describe();

  //任意一个扩展了 Describable 的类都拥有 describeWithEmphasis() 方法，
  //这个方法又会去调用实现类中实现的 describe() 方法
  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class Food implements Describable {
  void describe() {
    print('The food is delicious!');
  }

  void describeWithEmphasis() {
    describe();
  }
}