struct HasMultiOptional {
  a: Int?;
  b: String?;
  c: Address?;
}

contract OptStructsInside {
  s: HasMultiOptional;
  init() {
    self.s = HasMultiOptional{ a:null, b:null, c:null };
  }
}