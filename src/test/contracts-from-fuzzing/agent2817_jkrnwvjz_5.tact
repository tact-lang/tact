struct DeepNested {
  inner1: InnerStruct;
  inner2: InnerStruct;
}

struct InnerStruct {
  name: String;
  flag: Bool;
  nestedOpt: Int?;
}

contract Store {
  field: DeepNested;

  init() {
    self.field = DeepNested{
      inner1: InnerStruct{ name:"a", flag:true, nestedOpt:null },
      inner2: InnerStruct{ name:"b", flag:false, nestedOpt:5 }
    };
  }
}
