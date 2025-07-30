struct NestedStrings {
  s1: String;
  ns: NestedSub;
}

struct NestedSub {
  sub1: String;
  sub2: String;
}

contract TestNestedStrings {
  data: NestedStrings;

  init() {
    self.data = NestedStrings{
      s1: "foo",
      ns: NestedSub{sub1:"bar", sub2:"baz"}
    };
  }
}
