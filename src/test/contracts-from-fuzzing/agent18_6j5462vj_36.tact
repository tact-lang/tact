struct Skinny {
 a: Int;
}

contract ManySkinny {
  f1: Skinny;
  f2: Skinny;
  f3: Skinny;
  f4: Skinny;
  f5: Skinny;
  f6: Skinny;
  f7: Skinny;
  f8: Skinny;

  init() {
    self.f1 = Skinny{ a:1 };
    self.f2 = Skinny{ a:2 };
    self.f3 = Skinny{ a:3 };
    self.f4 = Skinny{ a:4 };
    self.f5 = Skinny{ a:5 };
    self.f6 = Skinny{ a:6 };
    self.f7 = Skinny{ a:7 };
    self.f8 = Skinny{ a:8 };
  }
}