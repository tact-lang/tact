struct Edge {
  a: Int;
  b: Bool?;
  c: String;
}

contract EdgeCase {
  e: Edge;

  init() {
    self.e = Edge{
      a: 100,
      b: null,
      c: "edge",
    };
  }
}