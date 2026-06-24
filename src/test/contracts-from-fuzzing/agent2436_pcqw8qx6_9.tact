struct InnerStruct {
  foo: Bool;
  bar: Int;
}

struct MidStruct {
  inner: InnerStruct;
  text: String;
}

contract TopLevel {
  mid1: MidStruct;
  mid2: MidStruct;

  init() {
    self.mid1 = MidStruct{inner: InnerStruct{foo:true,bar:5}, text:"hello"};
    self.mid2 = MidStruct{inner: InnerStruct{foo:false,bar:6}, text:"world"};
  }
}