struct Chain {
 x: Int;
}

struct Middle {
 chain: Chain;
}

struct Container {
 middle: Middle;
}

contract DeepAssign {
  val: Container;

  init() {
    self.val = Container{
      middle: Middle{
        chain: Chain{ x: 42 }
      }
    };
  }
}