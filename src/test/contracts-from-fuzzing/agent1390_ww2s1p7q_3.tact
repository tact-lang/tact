struct DeepNested {
  s1: Inner1;
}

struct Inner1 {
  s2: Inner2?;
}

struct Inner2 {
  s3: Inner3?;
}

struct Inner3 {
  flag: Bool;
}

contract Test {
  nested: DeepNested;

  init() {
    self.nested = DeepNested{ s1: Inner1{ s2: null } };
  }
}