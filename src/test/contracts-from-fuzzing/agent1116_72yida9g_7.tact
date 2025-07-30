struct SOptional {
  optInt: Int?;
  optBool: Bool?;
  optAddr: Address?;
  optCell: Cell?;
  optSlice: Slice?;
  optString: String?;
}

contract NestedOptionals {
  item: SOptional?;

  init() {
    self.item = SOptional{
      optInt: 1,
      optBool: false,
      optAddr: null,
      optCell: null,
      optSlice: null,
      optString: "abc",
    };
  }
}
