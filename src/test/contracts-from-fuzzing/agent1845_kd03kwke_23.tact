// Test mixing structs with many fields and optionals
struct ManyMixed {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
  i: Int;
  j: Bool;
}

contract ManyFieldsMixed {
  s: ManyMixed;

  init() {
    self.s = ManyMixed{
      a:1,b:true,c:null,d:null,e:5,f:false,g:null,h:null,i:9,j:true
    };
  }
}
