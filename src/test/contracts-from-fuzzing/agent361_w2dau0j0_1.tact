struct NestedSub {
  c: Bool;
  d: String;
}

struct NestedMain {
  a: Int;
  b: NestedSub;
}

contract DeepNestedExample {
  data: NestedMain;

  init() {
    self.data = NestedMain{
      a: 1,
      b: NestedSub{
        c: true,
        d: "test",
      },
    };
  }
}
