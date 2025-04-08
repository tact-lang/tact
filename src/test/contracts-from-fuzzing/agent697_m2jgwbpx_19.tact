struct Large {
  f0: Int;
  f1: Int;
  f2: Int;
  f3: Int;
  f4: Int;
  f5: Int;
  f6: Int;
  f7: Int;
  f8: Int;
  f9: Int;
  f10: Int;
  f11: Int;
  f12: Int;
  f13: Int;
  f14: Int;
  f15: Int;
  f16: Int;
  f17: Int;
  f18: Int;
  f19: Int;
  f20: Int;
  f21: Int;
  f22: Int;
  f23: Int;
  f24: Int;
  f25: Int;
  f26: Int;
  f27: Int;
  f28: Int;
  f29: Int;
  f30: Int;
  f31: Int;
  f32: Int;
  f33: Int;
  f34: Int;
  f35: Int;
  f36: Int;
  f37: Int;
  f38: Int;
  f39: Int;
}

contract Test {
    big: Large = Large{
      f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,
      f10:10,f11:11,f12:12,f13:13,f14:14,f15:15,f16:16,f17:17,f18:18,f19:19,
      f20:20,f21:21,f22:22,f23:23,f24:24,f25:25,f26:26,f27:27,f28:28,f29:29,
      f30:30,f31:31,f32:32,f33:33,f34:34,f35:35,f36:36,f37:37,f38:38,f39:39
    };

    init() {
        self.big = Large{
      f0:40,f1:41,f2:42,f3:43,f4:44,f5:45,f6:46,f7:47,f8:48,f9:49,
      f10:50,f11:51,f12:52,f13:53,f14:54,f15:55,f16:56,f17:57,f18:58,f19:59,
      f20:60,f21:61,f22:62,f23:63,f24:64,f25:65,f26:66,f27:67,f28:68,f29:69,
      f30:70,f31:71,f32:72,f33:73,f34:74,f35:75,f36:76,f37:77,f38:78,f39:79
        };
    }

    receive() {}
}
