struct Sub {
  a: Int;
  b: Bool;
  c: String;
  d: Address?;
  e: Int?;
  f: Bool?;
}

struct Super {
  s1: Sub;
  s2: Sub;
}

contract NestedSupers {
  data: Super;

  init() {
    self.data = Super{
      s1: Sub{a:1,b:true,c:"X",d:null,e:null,f:null},
      s2: Sub{a:2,b:false,c:"Y",d:null,e:null,f:true}
    };
  }
}