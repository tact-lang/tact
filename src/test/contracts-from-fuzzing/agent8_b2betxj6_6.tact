struct Sub1 {
  v1: Int;
}
struct Sub2 {
  v2: Bool;
}

struct Compose {
  c1: Sub1;
  c2: Sub2;
}

contract ComposedStructsTest {
  composed: Compose;

  init() {
    self.composed = Compose{
      c1: Sub1{v1:1},
      c2: Sub2{v2:true},
    };
  }
}