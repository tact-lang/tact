struct ManyFields {
  a1: Int;  a2: Int;  a3: Int;  a4: Int;  a5: Int;  a6: Int;  a7: Int;  a8: Int;
  b1: Bool; b2: Bool; b3: Bool; b4: Bool;
  s1: String; s2: String; s3: String;
  c1: Cell; c2: Cell;
  sl1: Slice; sl2: Slice;
  addr1: Address; addr2: Address;
  optInt: Int?; optBool: Bool?; optStr: String?;
}

contract TestContract {
  f: ManyFields;

  init() {
    self.f = ManyFields{
      a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,
      b1:true,b2:false,b3:true,b4:false,
      s1:"a",s2:"b",s3:"c",
      c1:emptyCell(), c2:emptyCell(),
      sl1:emptyCell().asSlice(), sl2:emptyCell().asSlice(),
      addr1:myAddress(), addr2:myAddress(),
      optInt:null, optBool:true, optStr:null
    };
  }
}