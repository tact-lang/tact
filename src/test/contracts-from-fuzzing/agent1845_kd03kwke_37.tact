// Large optional struct chain combining Int, Bool, String, Cell, Slice
struct MultiOpt {
  i: Int?;
  b: Bool?;
  s: String?;
  c: Cell?;
  sl: Slice?;
}

contract MultiOptional {
  m: MultiOpt?;
  init() {
    self.m = null;
  }
}
