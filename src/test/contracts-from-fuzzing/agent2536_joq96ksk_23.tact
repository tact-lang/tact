// large flat struct with optionals and required
struct Flat {
  i1: Int; i2: Int?; i3: Int;
  b1: Bool; b2: Bool?; b3: Bool;
  s1: String; s2: String?; s3: String;
  c1: Cell; c2: Cell?; c3: Cell;
  z1: Slice; z2: Slice?; z3: Slice;
  d1: Address; d2: Address?; d3: Address;
}

contract LargeFlat {
  f: Flat;

  init() {
    self.f = Flat{
      i1:1,i2:null,i3:3,
      b1:true,b2:null,b3:false,
      s1:"a",s2:null,s3:"c",
      c1:emptyCell(),c2:null,c3:emptyCell(),
      z1:emptyCell().asSlice(),z2:null,z3:emptyCell().asSlice(),
      d1:myAddress(),d2:null,d3:myAddress()
    };
  }
}