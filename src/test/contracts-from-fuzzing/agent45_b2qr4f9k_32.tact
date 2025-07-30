struct InnerA { foo: Int }
struct InnerB { bar: String? }

struct Container {
  a: InnerA;
  b: InnerB;
}

contract DoubleNest {
  val: Container;
  init() {
    self.val=Container{
      a:InnerA{foo:99}, b:InnerB{bar:null}
    };
  }
}