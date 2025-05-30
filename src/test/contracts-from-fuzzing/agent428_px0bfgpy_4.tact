struct NestedOptionals {
  optionalInt: Int?;
  deeper: InnerOptional?;
}

struct InnerOptional {
  name: String;
  flag: Bool;
}

contract OptionalStructDepth {
  state: NestedOptionals;
  
  init() {
    self.state = NestedOptionals{
      optionalInt: 5,
      deeper: InnerOptional{ name: "hi", flag: true }
    };
  }
}
