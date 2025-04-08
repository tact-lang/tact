// Very large struct (25 fields) with diverse primitives
struct Huge {
  a1: Int;
  a2: Bool;
  a3: Int?;
  a4: Bool?;
  a5: Int;
  a6: Bool;
  a7: Int?;
  a8: Bool?;
  a9: Int;
  a10: Bool;
  a11: Int?;
  a12: Bool?;
  a13: Int;
  a14: Bool;
  a15: Int?;
  a16: Bool?;
  a17: Int;
  a18: Bool;
  a19: Int?;
  a20: Bool?;
  a21: Int;
  a22: Bool;
  a23: Int?;
  a24: Bool?;
  a25: Int;
}

contract HugeFields {
  h: Huge;

  init() {
    self.h = Huge{
      a1:1,a2:true,a3:null,a4:null,a5:5,a6:false,a7:null,a8:null,a9:9,a10:true,
      a11:null,a12:null,a13:13,a14:false,a15:null,a16:null,a17:17,a18:true,a19:null,a20:null,
      a21:21,a22:false,a23:null,a24:null,a25:25
    };
  }
}
