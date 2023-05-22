void main() {
  //变量
  variables();

  //控制流程语句
  conFlow();

  // 函数
  var result = fibonacci(20);
  print(result);
}

//变量 https://dart.cn/samples#variables
void variables() {
  var name = 'Voyager I';
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', "Neptune"];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  print(name);
  print(antennaDiameter);
  print(image);

  //=> (胖箭头) 简写语法用于仅包含一条语句的函数。该语法在将匿名函数作为参数传递时非常有用
  //传入 where() 函数的参数即是一个匿名函数
  //将函数作为参数使用：将顶层函数 print() 作为参数传给了 forEach() 函数
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
}

//控制流程语句 https://dart.cn/samples#control-flow-statements
void conFlow() {
  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', "Neptune"];

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (var object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2026) {
    year += 1;
  }
}

//函数 https://dart.cn/samples#functions
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

//注释 https://dart.cn/samples#comments
/// 这是一个文档注释。
/// 文档注释用于为库、类以及类的成员添加注释。
/// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。

/* 也可以像这样使用单斜杠和星号的注释方式 */