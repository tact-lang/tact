struct Outermost {
  a: Int;
  nested: InnerLevel;
}

struct InnerLevel {
  x: Int;
  deep: DeeperLevel;
}

struct DeeperLevel {
  y: Int;
  z: Bool;
}

contract MultiDeepNested {
  s: Outermost;

  init() {
    self.s = Outermost{
      a: 1,
      nested: InnerLevel{
        x: 2,
        deep: DeeperLevel{
          y: 3,
          z: true
        }
      }
    };
  }
}