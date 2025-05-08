message EmptyMsg {}

struct Inner {
  msg: EmptyMsg?;
}

struct Outer {
  nested: Inner?;
}

contract NestedOptMsg {
  root: Outer;

  init() {
    self.root = Outer{ nested: null };
  }
}