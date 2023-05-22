//枚举 https://dart.cn/samples#enums

void main() {
  final yourPlanet = Planet.earth;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }
}

//声明一个简单的枚举类型：使用enum关键字并列出要枚举的值
//枚举  定义了一组行星类别：类地行星，类似木星的气体行星（类木行星），远日行星
enum PlanetType { terrestrial, gas, ice }

//增强型枚举示例，定义了一组行星类的常量实例，即太阳系的行星
//枚举  列举了太阳系中不同的行星以及它们的一些属性
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false), //水星
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false), //金星
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: true),
  //...
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true), //天王星
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true); //海王星

  ///A constant generating constructor
  //声明增强型枚举要求：
  //a.所有生成构造函数都必须是常量构造
  const Planet(
      //命名参数：将参数放在花括号中，调用时，指定参数名称（参数位置不重要，名称重要）
      //命名参数默认可选，若需要指定要求参数必须提供，可使用@required或required（看dart 版本）
      {required this.planetType,
      required this.moons,
      required this.hasRings});

  ///All instance variables are final
  //b.实例变量必须是final，包括由mixins添加的
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  ///Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}