struct One {
  x: Int;
}

struct Two {
  one: One;
}

struct Three {
  two: Two;
}

struct Four {
  three: Three;
}

contract VeryDeep {
  root: Four;

  init() {
    self.root = Four{
      three: Three{
        two: Two{
          one: One{
            x: 123
          }
        }
      }
    };
  }
}
