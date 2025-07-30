struct NestedStrings {
  s1: String;
  s2: String?;
}

struct WrapNestedStrings {
  wrapped: NestedStrings;
}

contract ContractWrapNestedStrings {
  data: WrapNestedStrings;

  init() {
    self.data = WrapNestedStrings{
      wrapped: NestedStrings{
        s1: "hello",
        s2: null,
      }
    };
  }
}
