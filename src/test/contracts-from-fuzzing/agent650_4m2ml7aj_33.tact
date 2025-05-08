// Mix deeply nested optionals, defaulted optionals, non-optionals
struct Leaf {
  x: Int? = null;
  y: String? = null;
}

struct Mid {
  a: Leaf?;
  b: Leaf;
}

struct Root {
  l: Mid?;
  r: Mid;
}

contract TestContract {
  root: Root;

  init() {
    self.root = Root{
      l: null,
      r: Mid{
        a: null,
        b: Leaf{ x: null, y: null }
      }
    };
  }
}
