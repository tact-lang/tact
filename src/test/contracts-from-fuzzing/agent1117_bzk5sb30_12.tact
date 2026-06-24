struct NumStructs {
  foo: Int;
  bar: Bool;
}

contract ManyPersistent {
  a: NumStructs;
  b: NumStructs;
  c: NumStructs;
  d: NumStructs;
  e: NumStructs;
  f: NumStructs;

  init() {
    self.a = NumStructs{ foo:1, bar:true };
    self.b = NumStructs{ foo:2, bar:true };
    self.c = NumStructs{ foo:3, bar:true };
    self.d = NumStructs{ foo:4, bar:false };
    self.e = NumStructs{ foo:5, bar:false };
    self.f = NumStructs{ foo:6, bar:true };
  }
}
