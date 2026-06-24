struct Levels3 {
  x: Int;
}

struct Levels2 {
  s: Levels3?;
}

struct Levels1 {
  s: Levels2?;
}

contract NullChain {
  st: Levels1;

  init() {
    self.st = Levels1{
      s: Levels2{
        s: null,
      },
    };
  }
}