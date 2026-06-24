struct ManyOptionalMixed {
  optStr: String?;
  optAddr: Address?;
  optCell: Cell?;
  optSlice: Slice?;
  optBool: Bool?;
}

contract MoreOpts {
  val: ManyOptionalMixed;

  init() {
    self.val = ManyOptionalMixed{
      optStr: null,
      optAddr: null,
      optCell: null,
      optSlice: null,
      optBool: true
    };
  }
}