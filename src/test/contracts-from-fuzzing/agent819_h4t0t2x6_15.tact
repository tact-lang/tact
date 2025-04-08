struct Defaults {
  a: Int = 42;
  b: String = "hi";
  c: Bool = true;
}

struct Outer {
  payload: Defaults;
  value: Int;
}

contract TestContract {
  st: Outer;

  init() {
    self.st = Outer{
      payload: Defaults{},
      value: 5
    };
  }
}