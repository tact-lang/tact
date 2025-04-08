struct OptionalPrimitives {
  i: Int?;
  b: Bool?;
  s: String?;
  c: Cell?;
  sl: Slice?;
  addr: Address?;
}

contract OptPrimitivesContract {
  opt: OptionalPrimitives;

  init() {
    self.opt = OptionalPrimitives{
      i: null, b: null, s: null, c: null, sl: null, addr: null
    };
  }
}