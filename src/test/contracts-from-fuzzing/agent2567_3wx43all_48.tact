struct Wrap {
  a: Int;
}

contract NullableNestedWrap {
  w: Wrap?;
  init(){
    self.w = Wrap{a:42};
  }
}