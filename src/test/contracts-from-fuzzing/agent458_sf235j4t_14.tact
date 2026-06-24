struct NestedStrings {
  a: String = "a";
  b: String = "b";
  c: String?;
}

struct Wrapper {
  inner: NestedStrings;
  num: Int = 123;
}

contract LotsOfStrings {
  field: Wrapper;

  init() {
    self.field = Wrapper{
      inner: NestedStrings{
        a: "1",
        b: "2",
        c: "3"
      },
      num: 456
    };
  }
}