struct Many {
  foo: Int;
  bar: Bool;
  baz: String;
  qux: Int?;
  quux: String?;
}

contract AllKindsTest {
  data: Many;
  init() {
    self.data = Many{foo:1,bar:true,baz:"s",qux:null,quux:null};
  }
}