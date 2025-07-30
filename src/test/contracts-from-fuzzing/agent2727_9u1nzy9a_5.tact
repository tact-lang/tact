struct PrimitiveOptionals {
 a: Int?;
 b: Bool?;
 c: Address?;
 d: Cell?;
 e: Slice?;
 f: String?;
}

contract PrimitiveOptionalsContract {
  po: PrimitiveOptionals;

  init() {
    self.po = PrimitiveOptionals{ a: null, b: null, c: null, d: null, e: null, f: null };
  }
}