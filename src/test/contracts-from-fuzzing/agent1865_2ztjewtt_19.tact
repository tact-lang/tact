struct S {
  a: Int?;
}

contract DefAndInit {
  f: S = S{ a: null };

  init() {
    self.f = S{ a: null };
  }
}