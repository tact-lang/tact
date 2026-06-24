struct InnerStruct1 {
  a: Int;
}

struct InnerStruct2 {
  b: Bool;
}

struct Container {
  s1: InnerStruct1;
  s2: InnerStruct2;
  optStr: String?;
}

contract TestContract {
  container: Container;

  init() {
    self.container = Container{
      s1: InnerStruct1{a: 10},
      s2: InnerStruct2{b: true},
      optStr: null,
    };
  }
}
