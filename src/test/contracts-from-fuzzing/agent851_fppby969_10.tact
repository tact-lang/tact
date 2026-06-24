struct OptionalInInner { foo: Int?; bar: String?; }

struct OuterContainer {
  inner1: OptionalInInner;
  inner2: OptionalInInner?;
}

contract NestedOptionals {
  data: OuterContainer;
  init() {
    self.data = OuterContainer{
      inner1: OptionalInInner{ foo: 1, bar: null },
      inner2: null
    };
  }
}