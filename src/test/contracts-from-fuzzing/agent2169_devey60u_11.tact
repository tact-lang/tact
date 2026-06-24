struct LargeList1 {
 x1:Int; x2:Int; x3:Int; x4:Int; x5:Int;
 x6:Int; x7:Int; x8:Int; x9:Int; x10:Int;
 x11:Int; x12:Int; x13:Int; x14:Int; x15:Int;
}

struct LargeList2 {
 y1:Int; y2:Int; y3:Int; y4:Int; y5:Int;
 y6:Int; y7:Int; y8:Int; y9:Int; y10:Int;
 y11:Int; y12:Int; y13:Int; y14:Int; y15:Int;
}

contract LargeStructs {
  f1: LargeList1;
  f2: LargeList2;

  init() {
    self.f1 = LargeList1{
      x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,x9:9,x10:10,x11:11,x12:12,x13:13,x14:14,x15:15
    };
    self.f2 = LargeList2{
      y1:1,y2:2,y3:3,y4:4,y5:5,y6:6,y7:7,y8:8,y9:9,y10:10,y11:11,y12:12,y13:13,y14:14,y15:15
    };
  }
}