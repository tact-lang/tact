struct MixedOptional {
  num: Int;
  maybeText: String?;
  maybeBool: Bool?;
}

struct ContainsMixed {
  nested: MixedOptional;
}

contract NestedOptionals {
  d: ContainsMixed;

  init() {
    self.d = ContainsMixed{
      nested: MixedOptional{
        num: 5,
        maybeText: null,
        maybeBool: null
      }
    };
  }
}