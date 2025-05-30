struct NestStr {
  s: String;
  n: Int;
}

contract StringMix {
  foo: NestStr;

  init() {
    self.foo = NestStr{ s:"hi", n:42 };
  }
}