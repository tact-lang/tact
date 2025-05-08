struct Inner {
  x: Int;
  y: Bool;
}

struct Outer {
  nested1: Inner;
  nested2: Inner;
}

contract DeepNested {
  val: Outer;

  init() {
    self.val = Outer{
      nested1: Inner{ x: 1, y:true },
      nested2: Inner{ x:2, y:false }
    };
  }
}