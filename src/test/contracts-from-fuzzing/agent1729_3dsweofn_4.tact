struct ManyOpts {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
}

contract TestContract {
  val: ManyOpts;

  init() {
    self.val = ManyOpts{
      a: null,
      b: null,
      c: null,
      d: null,
    };
  }
}