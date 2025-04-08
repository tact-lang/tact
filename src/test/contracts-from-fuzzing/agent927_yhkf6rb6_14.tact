struct NestedStrings {
  s1: String;
  s2: String?;
  next: Nested2;
}

struct Nested2 {
  sn1: String;
  sn2: String?;
}

contract StringDeepTest {
  store: NestedStrings;

  init() {
    self.store = NestedStrings{
      s1: "a",
      s2: null,
      next: Nested2{
        sn1: "b",
        sn2: null
      }
    };
  }
}