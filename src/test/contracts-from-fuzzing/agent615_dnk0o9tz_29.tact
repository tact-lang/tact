struct HasString {
  s: String;
}

struct HasInt {
  i: Int;
}

struct Container {
  a: HasString;
  b: HasInt;
}

contract TestContract {
  c: Container;

  init() {
    self.c = Container{
      a: HasString { s: "hi" },
      b: HasInt { i: 7 }
    };
  }
}