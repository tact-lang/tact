struct NestedStrings {
  s1: String;
  s2: String;
}

struct OuterString {
  nest: NestedStrings;
}

contract StringInsideStruct {
  data: OuterString;

  init() {
    self.data = OuterString{ nest: NestedStrings{ s1: "one", s2: "two" } };
  }
}