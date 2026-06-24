// Very deep nested chain with optionals at many levels

struct Leaf {
  val: Int;
}

struct N4 {
  leaf: Leaf?;
}

struct N3 {
  n4: N4?;
}

struct N2 {
  n3: N3?;
}

struct N1 {
  n2: N2?;
}

contract DeepOptionalChain {
  root: N1;

  init() {
    self.root = N1{
      n2: N2{
        n3: N3{
          n4: null
        }
      }
    };
  }
}