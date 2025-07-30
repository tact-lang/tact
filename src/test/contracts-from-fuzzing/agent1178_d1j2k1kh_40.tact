// nested entities with empty string and zero int edge cases
struct Edge {
  s: String;
  i: Int;
}

contract Test {
  data: Edge;
  init() {
    self.data = Edge{
      s: "",
      i: 0
    };
  }
}