struct Inner1 {
  a: Int?;
}

struct Inner2 {
  b: Bool?;
}

struct Both {
  f1: Inner1?;
  f2: Inner2?;
}

contract DualOptionals {
  pack: Both?;
}
