struct S {
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

contract ManyNestedStructs {
  f1: S;
  f2: S;
  f3: S;
  f4: S;
  f5: S;

  init() {
    self.f1=S{ s1:1,s2:2,s3:3,s4:4,s5:5,s6:6,s7:7,s8:8,s9:9,s10:10 };
    self.f2=S{ s1:11,s2:12,s3:13,s4:14,s5:15,s6:16,s7:17,s8:18,s9:19,s10:20 };
    self.f3=S{ s1:21,s2:22,s3:23,s4:24,s5:25,s6:26,s7:27,s8:28,s9:29,s10:30 };
    self.f4=S{ s1:31,s2:32,s3:33,s4:34,s5:35,s6:36,s7:37,s8:38,s9:39,s10:40 };
    self.f5=S{ s1:41,s2:42,s3:43,s4:44,s5:45,s6:46,s7:47,s8:48,s9:49,s10:50 };
  }
}
