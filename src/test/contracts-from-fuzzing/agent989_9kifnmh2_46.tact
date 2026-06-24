// Optional chain with optional field outside
struct OutOpt {
  inner: Inner?;
}

struct Inner {
  deep: Int;
}

contract OptOnce {
  foo: OutOpt;
  init() {
    self.foo = OutOpt{ inner: Inner{ deep: 7 } };
  }
}