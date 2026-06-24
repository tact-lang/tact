struct NestedStrings {
  name: String;
  desc: String?;
}

contract StringOptionalTest {
  data: NestedStrings;
  init() {
    self.data = NestedStrings{
      name: "abc",
      desc: null
    };
  }
}