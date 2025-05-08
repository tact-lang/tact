struct MixNested {
  a: Int?;
  b: Int;
  c: Bool?;
}

struct Top {
  inner: MixNested;
  extra: String;
}

contract ComboNestedOptional {
  rec: Top;
  init() {
    self.rec = Top{ inner:MixNested{a:null,b:5,c:true}, extra:"x" };
  }
}