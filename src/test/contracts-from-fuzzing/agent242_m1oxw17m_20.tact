struct HugeStruct {
 f01: Int; f02: Int; f03: Int; f04: Int; f05: Int;
 f06: Int; f07: Int; f08: Int; f09: Int; f10: Int;
 f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;
 f16: Int; f17: Int; f18: Int; f19: Int; f20: Int;
 f21: Int; f22: Int; f23: Int; f24: Int; f25: Int;
 f26: Int; f27: Int; f28: Int; f29: Int; f30: Int;
 f31: Int; f32: Int; f33: Int; f34: Int; f35: Int;
 f36: Int; f37: Int; f38: Int; f39: Int; f40: Int;
 f41: Int; f42: Int; f43: Int; f44: Int; f45: Int;
 f46: Int; f47: Int; f48: Int; f49: Int; f50: Int;
}

contract MaxFieldTest {
 big: HugeStruct;

 init() {
   self.big = HugeStruct{
    f01:1,f02:2,f03:3,f04:4,f05:5,
    f06:6,f07:7,f08:8,f09:9,f10:10,
    f11:11,f12:12,f13:13,f14:14,f15:15,
    f16:16,f17:17,f18:18,f19:19,f20:20,
    f21:21,f22:22,f23:23,f24:24,f25:25,
    f26:26,f27:27,f28:28,f29:29,f30:30,
    f31:31,f32:32,f33:33,f34:34,f35:35,
    f36:36,f37:37,f38:38,f39:39,f40:40,
    f41:41,f42:42,f43:43,f44:44,f45:45,
    f46:46,f47:47,f48:48,f49:49,f50:50,
   };
 }
}