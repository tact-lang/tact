struct Coord {
  x: Int;
  y: Int;
}

struct Container {
  a: Coord?;
  b: Coord?;
  c: Coord?;
}

contract MultiOptStructs {
  cs: Container;

  init() {
    self.cs = Container{ a:null, b:null, c:null };
  }
}