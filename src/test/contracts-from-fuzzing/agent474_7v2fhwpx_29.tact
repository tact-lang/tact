struct Big1 {
  a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
  a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
}

struct Big2 {
  b1: Big1;
  b2: Big1;
}

contract ManyBigStructs {
  f1: Big2;
  f2: Big2;

  init() {
    self.f1 = Big2{
      b1: Big1{ a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10 },
      b2: Big1{ a1:11,a2:12,a3:13,a4:14,a5:15,a6:16,a7:17,a8:18,a9:19,a10:20 }
    };
    self.f2 = Big2{
      b1: Big1{ a1:21,a2:22,a3:23,a4:24,a5:25,a6:26,a7:27,a8:28,a9:29,a10:30 },
      b2: Big1{ a1:31,a2:32,a3:33,a4:34,a5:35,a6:36,a7:37,a8:38,a9:39,a10:40 }
    };
  }
}
