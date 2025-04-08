struct DeepOptional {
  first: Int?;
  second: Bool?;
  third: String?;
  fourth: Address?;
  fifth: Cell?;
  sixth: Slice?;
}

contract OptCombine {
  value: DeepOptional;
  init() {
    self.value = DeepOptional{
      first: null,
      second: null,
      third: null,
      fourth: null,
      fifth: null,
      sixth: null
    };
  }
}
