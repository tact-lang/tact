struct SubStruct {
  foo: Int;
  bar: Bool?;
  baz: String;
}

contract LongFieldOrder {
  f1: Int;
  f2: String;
  f3: SubStruct;
  f4: Int?;
  f5: Bool;
  f6: Bool?;
  f7: String?;
  f8: SubStruct;
  f9: String;
  f10: Int;

  init() {
    self.f1 = 1;
    self.f2 = "a";
    self.f3 = SubStruct{ foo: 10, bar: null, baz: "x" };
    self.f4 = null;
    self.f5 = true;
    self.f6 = false;
    self.f7 = null;
    self.f8 = SubStruct{ foo: 22, bar: true, baz: "y" };
    self.f9 = "z";
    self.f10 = 7;
  }
}