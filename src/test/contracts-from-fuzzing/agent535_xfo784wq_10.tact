struct Child {
  val: Int;
}

struct Wrap1 { child: Child }
struct Wrap2 { wrap1: Wrap1 }
struct Wrap3 { wrap2: Wrap2 }

contract NestedMix {
  data: Wrap3;

  init() {
    self.data = Wrap3{wrap2: Wrap2{wrap1: Wrap1{child: Child{val: 42}}}};
  }
}