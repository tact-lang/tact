struct D1 { x: Int; y: String; }
struct D2 { p: Bool; q: Address; }

struct Big {
  d1a: D1;
  d2a: D2;
  d1b: D1;
  d2b: D2;
  int1: Int;
  int2: Int;
  int3: Int;
  int4: Int;
  s1: String;
  s2: String;
  s3: String;
  s4: String;
  a1: Address;
  a2: Address;
  a3: Address;
  a4: Address;
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
}

contract C {
  data: Big;

  init() {
    self.data = Big{
      d1a: D1{x:1,y:"a"},
      d2a: D2{p:true,q:myAddress()},
      d1b: D1{x:2,y:"b"},
      d2b: D2{p:false,q:myAddress()},
      int1: 1,int2:2,int3:3,int4:4,
      s1:"x", s2:"y", s3:"z", s4:"w",
      a1:myAddress(),a2:myAddress(),a3:myAddress(),a4:myAddress(),
      b1:true,b2:false,b3:true,b4:false
    };
  }
}