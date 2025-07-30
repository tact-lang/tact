// deeply nested optional leaf inside optional branch
struct A {
  branch: B?;
}

struct B {
  leaf: C?;
}

struct C {
  num: Int?;
}

contract DeepOptionalBranch {
  root: A;

  init() {
    self.root = A{
      branch: B{
        leaf: C{ num: null }
      }
    };
  }
}