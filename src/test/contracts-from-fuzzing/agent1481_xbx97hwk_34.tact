// Deep optional of struct containing optionals
struct PrimOpt {
  a: Int?;
  b: Bool?;
}

struct Outer {
  inner: PrimOpt?;
}

contract OptInOpt {
  val: Outer;
  init() {
    self.val = Outer{ inner: null };
  }
}