struct Tail {
  left: Int;
  right: Int;
}

struct Middle {
  tail: Tail;
  flag: Bool;
}

struct Head {
  middle: Middle;
  name: String;
}

contract DeepChain {
  node: Head = Head{
    middle: Middle{
      tail: Tail{ left: 1, right: 2 },
      flag: true
    },
    name: "abc"
  };

  init() {
    self.node = self.node;
  }

  receive() {
    self.node = self.node;
  }
}