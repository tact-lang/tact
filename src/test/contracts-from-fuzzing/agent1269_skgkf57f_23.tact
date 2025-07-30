struct Large {
 a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
 b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
 s1: String; s2: String; s3: String;
 addr1: Address; addr2: Address;
 c1: Cell; c2: Cell;
 sl1: Slice; sl2: Slice;
}

contract StructLargeFields {
 var: Large;
 init() {
  self.var = Large{
    a1:1,a2:2,a3:3,a4:4,a5:5,
    b1:true,b2:false,b3:true,b4:false,b5:true,
    s1:"a",s2:"b",s3:"c",
    addr1:myAddress(), addr2:myAddress(),
    c1:emptyCell(), c2:emptyCell(),
    sl1:emptyCell().asSlice(), sl2:emptyCell().asSlice()
  };
 }
}