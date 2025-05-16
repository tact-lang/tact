// very deeply nested chain alternated optional / non-optional
struct L4 {
  val: Int;
}

struct L3 {
  next: L4?;
}

struct L2 {
  next: L3;
}

struct L1 {
  next: L2?;
}

contract AltNest {
  root: L1;

  init() {
    self.root = L1{
      next: L2{ next: L3{ next: L4{ val: 42 } } }
    };
  }
}
