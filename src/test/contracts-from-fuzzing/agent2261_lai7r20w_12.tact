struct LargeFields {
  bigStr: String;
  bigNum: Int;
}

contract LargePersistent {
  info: LargeFields;

  init() {
    self.info = LargeFields {
      bigStr: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      bigNum: 12345678901234567890123456789012345678901234567890
    };
  }
}