struct Leaf { d: String; }
struct Node { leaf: Leaf; }
struct Root { node: Node; }

struct Mixed {
  f: Bool;
  n: Int;
  text: String;
  sub: Leaf;
}

contract MixedFields {
  root: Root;
  mix: Mixed;

  init() {
    self.root = Root{ node: Node{ leaf: Leaf{ d: "deep" } } };
    self.mix = Mixed{ f: true, n: 8, text: "hi", sub: Leaf{ d: "leaf" } };
  }
}