struct Sub {
  s: String;
  o: String?;
}

struct Middle {
  sub: Sub;
}

struct Container {
  mid: Middle;
}

contract OptionalDeepStructTest {
  field: Container;

  init() {
    self.field = Container {
      mid: Middle {
        sub: Sub {
          s: "abc",
          o: null
        }
      }
    };
  }
}