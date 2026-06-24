struct A {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
}

contract MixFields {
  a: A;
  flag: Bool;
  num: Int;

  init() {
    self.a = A{
      intVal: 42,
      boolVal: false,
      stringVal: "data",
    };
    self.flag = true;
    self.num = -100;
  }
}