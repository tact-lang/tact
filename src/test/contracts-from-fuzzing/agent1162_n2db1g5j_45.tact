struct NestedWrap {
  a: Int;
  b: Int?;
  c: String;
  d: String?;
  e: Bool;
  f: Bool?;
}

contract MixAll {
  n1: NestedWrap;
  n2: NestedWrap;

  init() {
    self.n1 = NestedWrap{a:1,b:null,c:"x",d:null,e:true,f:null};
    self.n2 = NestedWrap{a:2,b:null,c:"y",d:null,e:false,f:null};
  }
}