// test optional struct fields inside struct + null init
struct Child {
  x:Int;
}
struct Parent {
  c:Child?;
}
contract OptionalStructField {
  p:Parent;
  init() {
    self.p=Parent{c:null};
  }
}