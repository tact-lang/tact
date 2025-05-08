struct Foo {
  s: String;
  i: Int?;
}

contract Test {
  a: Foo;

  init() {
    self.a = Foo{s:"abc",i:null};
  }
}