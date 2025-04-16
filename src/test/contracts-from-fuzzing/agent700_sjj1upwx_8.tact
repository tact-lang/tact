struct ProbablyBig {
  i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
  i6: Int; i7: Int; i8: Int; i9: Int; i10: Int;
  b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
  s1: String; s2: String; s3: String; s4: String; s5: String;
  o1: Int?; o2: Bool?; o3: String?; o4: Int?; o5: Bool?;
}

contract FatPersistent {
  huge: ProbablyBig;

  init() {
    self.huge = ProbablyBig{
      i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10,
      b1:true,b2:false,b3:true,b4:false,b5:true,
      s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
      o1:null,o2:null,o3:null,o4:null,o5:null
    };
  }
}