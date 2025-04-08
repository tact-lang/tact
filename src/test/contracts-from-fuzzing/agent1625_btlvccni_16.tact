struct X1 { v1: Int; }
struct X2 { v2: Int; }
struct X3 { v3: Int; }
struct X4 { v4: Int; }
struct X5 { v5: Int; }
struct X6 { v6: Int; }
struct X7 { v7: Int; }
struct X8 { v8: Int; }
struct X9 { v9: Int; }
struct X10 { v10: Int; }

struct Batch {
  x1: X1;
  x2: X2;
  x3: X3;
  x4: X4;
  x5: X5;
  x6: X6;
  x7: X7;
  x8: X8;
  x9: X9;
  x10: X10;
}

contract ManyNestedStructs {
  data: Batch;

  init() {
    self.data = Batch{
      x1: X1{v1:1},
      x2: X2{v2:2},
      x3: X3{v3:3},
      x4: X4{v4:4},
      x5: X5{v5:5},
      x6: X6{v6:6},
      x7: X7{v7:7},
      x8: X8{v8:8},
      x9: X9{v9:9},
      x10:X10{v10:10}
    };
  }
}
