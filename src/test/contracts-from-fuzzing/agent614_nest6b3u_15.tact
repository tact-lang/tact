struct S1 { a:Int; }
struct S2 { b:Int; }

struct ComboStruct {
  a: S1;
  b: S2?;
  c: String;
  d: Bool;
  e: String?;
}

contract ComboOptional {
  record: ComboStruct;

  init() {
    self.record = ComboStruct{
      a:S1{a:1},
      b:null,
      c:"text",
      d:true,
      e:null
    };
  }
}