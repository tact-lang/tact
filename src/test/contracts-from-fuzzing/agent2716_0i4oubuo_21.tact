struct SingleField {
  x: Int;
}

struct DoubleWrap {
  s: SingleField;
}

contract WrapField {
  f: DoubleWrap;

  init() {
    self.f = DoubleWrap{s: SingleField{x: 123}};
  }
}