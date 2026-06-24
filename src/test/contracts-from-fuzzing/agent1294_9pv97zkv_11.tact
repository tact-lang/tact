struct TwoStrings {
  title: String;
  description: String?;
}

contract StringsWithOptional {
  field: TwoStrings = TwoStrings{
    title: "hello",
    description: null
  };
  receive() {}
}