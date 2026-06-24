struct Inner {
  value: Int?;
}

struct Outer {
  nested: Inner?;
}

contract OptInOpt {
  state: Outer = Outer{ nested: null };
}