struct S {
  x: Int?;
}
struct T {
  s: S?;
}

struct U {
  t: T;
}

contract NestedOptionWrapContract {
  data: U;
  init() {
    self.data = U{
      t: T{ s: null }
    };
  }
}