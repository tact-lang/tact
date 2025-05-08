struct ManyOptions {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Address?;
}

contract ContractWithManyOptionals {
  opt: ManyOptions;

  init() {
    self.opt = ManyOptions{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null
    };
  }
}