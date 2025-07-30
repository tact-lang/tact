struct StringsAndBools {
  a: Bool;
  b: String;
  c: Bool;
  d: String;
}

contract Interleaved {
  data: StringsAndBools;

  init() {
    self.data = StringsAndBools{
      a: true,
      b: "yes",
      c: false,
      d: "no"
    };
  }
}
