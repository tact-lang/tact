struct MultilevelOpt {
  a: Int?;
  b: Bool?;
  s: String?;
}

contract StructWithOptionals {
  data: MultilevelOpt;

  init() {
    self.data = MultilevelOpt{ a: null, b: null, s: null };
  }
}