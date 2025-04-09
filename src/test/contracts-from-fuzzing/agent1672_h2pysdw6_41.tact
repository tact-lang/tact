struct DeepDefaults {
  a:Int=1;
  b:Int=2;
  c:Int=3;
}

struct NestDefaults {
  d:DeepDefaults;
  e:DeepDefaults;
}

contract MultiDefaults {
  f:NestDefaults;
  g:DeepDefaults;

  init() {
    self.f = NestDefaults{d:DeepDefaults{}, e:DeepDefaults{}};
    self.g = DeepDefaults{};
  }
}
