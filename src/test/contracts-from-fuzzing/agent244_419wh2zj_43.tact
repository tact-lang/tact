// Persistent optional complex chain, assign null to inner nested optional value
struct Leaf {
  n: Int;
}

struct Mid {
  leaf: Leaf?;
}

contract InnerNull {
  state: Mid?;

  init() {
    self.state = Mid{
      leaf: null
    };
  }
}