struct LargeStruct {
 x1: Int;
 x2: Bool;
 x3: Int;
 x4: Bool;
 x5: Int;
 x6: Bool;
 x7: Int;
 x8: Bool;
 x9: Int;
 x10: Bool;
 x11: Int;
 x12: Bool;
 x13: Int;
 x14: Bool;
 x15: Int;
 x16: Bool;
 x17: Int;
 x18: Bool;
 x19: Int;
 x20: Bool;
}

contract LargeStructTest {
  st: LargeStruct;

  init() {
    self.st = LargeStruct{
      x1:1,x2:true,x3:2,x4:false,x5:3,x6:true,x7:4,x8:false,x9:5,x10:true,
      x11:6,x12:false,x13:7,x14:true,x15:8,x16:false,x17:9,x18:true,x19:10,x20:false
    };
  }
}