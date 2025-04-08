struct One {
  v: Int;
}

struct Two {
  v: Bool;
}

struct Three {
  v: String;
}

contract MultiNested {
  s1: One;
  s2: Two;
  s3: Three;

  init() {
    self.s1 = One{ v: 1 };
    self.s2 = Two{ v: true };
    self.s3 = Three{ v: "hello" };
  }
}
