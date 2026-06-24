struct Composed {
  a: Int;
  b: String;
  c: Bool;
}

contract ComposedDefaults {
  field: Composed = Composed{a:42,b:"hi",c:true};

  init() {
    self.field = Composed{a:1,b:"x",c:false};
  }
}