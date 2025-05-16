struct Deep {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
}

contract ManyOptionals {
  deep: Deep?;
  someInt: Int;

  init() {
    self.deep = null;
    self.someInt = 0;
  }

  receive() {}
}