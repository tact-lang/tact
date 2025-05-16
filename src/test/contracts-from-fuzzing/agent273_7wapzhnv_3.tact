struct S1 {
  val: Int;
}

struct S2 {
  s1: S1;
  optFlag: Bool?;
}

contract TestContract {
  info: S2;

  init() {
    self.info = S2{
      s1: S1{ val: 123 },
      optFlag: null
    };
  }
}