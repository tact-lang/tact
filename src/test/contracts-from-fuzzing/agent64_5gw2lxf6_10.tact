struct ManyOptional {
  f1: Int?;
  f2: Bool?;
  f3: String?;
  f4: Cell?;
  f5: Slice?;
  f6: Address?;
  f7: Int?;
  f8: Bool?;
  f9: String?;
  f10: Cell?;
  f11: Slice?;
  f12: Address?;
}

contract TestContract {
  opt: ManyOptional;

  init() {
    self.opt = ManyOptional{
      f1: null, f2: null, f3: null, f4: null, f5: null, f6: null,
      f7: null, f8: null, f9: null, f10: null, f11: null, f12: null
    };
  }
}