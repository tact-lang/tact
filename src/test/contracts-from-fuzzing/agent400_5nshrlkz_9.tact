struct Innermost {
  x: Int;
  y: Bool;
}

struct Middle {
  innermost: Innermost;
}

struct OuterMost {
  middle: Middle;
}

contract TestStructChain {
  storage: OuterMost;

  init() {
    self.storage = OuterMost {
      middle: Middle {
        innermost: Innermost {
          x: 10,
          y: true
        }
      }
    };
  }

  receive() {
    let _ = self.storage.middle.innermost.x;
  }
}