struct StrNest {
  a: String?;
}

contract NullStrNest {
  s: StrNest = StrNest{ a:null };

  init() {
    self.s = StrNest{ a: null };
  }
}