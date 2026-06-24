struct ConstNested {
  foo: Int = 1;
  bar: Int?;
}

contract DefaultVsUnset {
  data: ConstNested;

  init() {
    self.data = ConstNested{
      bar: null
    };
  }
}