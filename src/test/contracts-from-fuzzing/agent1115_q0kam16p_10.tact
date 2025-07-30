struct InnerLevel {
  foo: Int;
}

struct MiddleLevel {
  inner: InnerLevel;
}

struct OuterLevel {
  middle: MiddleLevel;
}

contract TestContract {
  data: OuterLevel;
  extra: Bool;

  init() {
    self.data = OuterLevel{
      middle: MiddleLevel{
        inner: InnerLevel{ foo: 999 }
      }
    };
    self.extra = true;
  }
}