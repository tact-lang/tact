struct DeeplyNested {
  field1: Int;
  field2: Bool;
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  optstr: String?;
  inner2: InnerStruct2;
}

struct InnerStruct2 {
  foo: Int;
  bar: String;
}

contract NestingDepth {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested {
      field1:1,
      field2:true,
      inner: InnerStruct {
        flag:false,
        optstr:null,
        inner2: InnerStruct2{ foo:3, bar:"hi" }
      }
    };
  }
}
