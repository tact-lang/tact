struct A { a: Int }
struct B { b: Int }

struct Container {
  aOpt: A?;
  bOpt: B?;
  flag: Bool;
}

contract ComplexOpt {
  val: Container;
  init() {
    self.val = Container{
      aOpt: null,
      bOpt: null,
      flag: true
    };
  }
}