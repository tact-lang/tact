struct WithStrings {
  name: String;
  comment: String;
}

contract StringFields {
  strings: WithStrings;

  init() {
    self.strings = WithStrings{
      name: "tact",
      comment: "smart contracts!"
    };
  }
}