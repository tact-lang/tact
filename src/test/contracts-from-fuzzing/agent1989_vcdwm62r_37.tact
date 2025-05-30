struct SuperNested {
  s1: Int;
  s2: Int;
  s3: Int;
  s4: Int;
  s5: Int;
  s6: Int;
  s7: Int;
  s8: Int;
  s9: Int;
  s10: Int;
}

struct VeryNested {
  one: SuperNested;
  two: SuperNested;
  three: SuperNested;
}

contract MegaNesting {
  data: VeryNested;

  init() {
    self.data = VeryNested{
      one: SuperNested{
        s1:1,s2:2,s3:3,s4:4,s5:5,s6:6,s7:7,s8:8,s9:9,s10:10
      },
      two: SuperNested{
        s1:11,s2:12,s3:13,s4:14,s5:15,s6:16,s7:17,s8:18,s9:19,s10:20
      },
      three: SuperNested{
        s1:21,s2:22,s3:23,s4:24,s5:25,s6:26,s7:27,s8:28,s9:29,s10:30
      }
    };
  }
}