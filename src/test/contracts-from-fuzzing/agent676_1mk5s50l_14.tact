struct NestedStrings {
  s: String;
  next: NestedStrings2;
}

struct NestedStrings2 {
  s: String;
  next: NestedStrings3;
}

struct NestedStrings3 {
  s: String;
}

contract NestedStringsTest {
  state: NestedStrings;

  init() {
    self.state = NestedStrings {
      s: "a",
      next: NestedStrings2 {
        s: "b",
        next: NestedStrings3 { s: "c" }
      }
    };
  }
}