struct Bundle {
  foo: Int;
  bar: Bool?;
}

contract ComposeStructs {
  s: Bundle = Bundle{ foo:7, bar:null };

  init() {
    self.s = Bundle{ foo:42, bar:true };
  }
}