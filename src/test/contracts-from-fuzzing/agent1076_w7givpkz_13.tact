struct Inner {
  innerVal: Int;
}

struct Outer {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Address;
  f: Inner;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Slice?;
  k: Address?;
  l: Inner?;
}

contract MixedComplex {
  data: Outer;

  init() {
    self.data = Outer{
      a:1,b:true,c:"x",d:emptyCell().asSlice(),e:myAddress(),
      f:Inner{innerVal: 1},
      g:null,h:null,i:null,j:null,k:null,l:null
    };
  }
}
