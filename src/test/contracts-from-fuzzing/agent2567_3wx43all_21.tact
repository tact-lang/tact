struct InnerMost {
  a: Int?;
}
struct Inner {
  innerMost: InnerMost?;
}
contract MultiNullableNested {
  nested: Inner?;
  init(){
    self.nested = Inner{innerMost: InnerMost{a:42}};
  }
}