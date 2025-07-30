struct OptionStrMix {
  a: Int?;
  b: String?;
  c: Bool?;
}

contract OptStrHolder {
  storage: OptionStrMix;

  init() {
    self.storage = OptionStrMix{
      a:null,
      b:null,
      c:true,
    };
  }
}