struct Large {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;
    f16: Int; f17: Int; f18: Int; f19: Int; f20: Int;
    f21: Int; f22: Int; f23: Int; f24: Int; f25: Int;
}

contract Test {
    d1: Large;
    d2: Large;

    init() {
        self.d1 = Large{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,f16:16,f17:17,f18:18,f19:19,f20:20,
            f21:21,f22:22,f23:23,f24:24,f25:25
        };
        self.d2 = Large{
            f1:26,f2:27,f3:28,f4:29,f5:30,f6:31,f7:32,f8:33,f9:34,f10:35,
            f11:36,f12:37,f13:38,f14:39,f15:40,f16:41,f17:42,f18:43,f19:44,f20:45,
            f21:46,f22:47,f23:48,f24:49,f25:50
        };
    }
}