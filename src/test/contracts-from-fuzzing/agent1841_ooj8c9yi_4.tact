struct OneHundredFields {
    f01: Int;
    f02: Int;
    f03: Int;
    f04: Int;
    f05: Int;
    f06: Int;
    f07: Int;
    f08: Int;
    f09: Int;
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
    f40: Int;
    f41: Int;
    f42: Int;
    f43: Int;
    f44: Int;
    f45: Int;
    f46: Int;
    f47: Int;
    f48: Int;
    f49: Int;
    f50: Int;
    f51: Int;
    f52: Int;
    f53: Int;
    f54: Int;
    f55: Int;
    f56: Int;
    f57: Int;
    f58: Int;
    f59: Int;
    f60: Int;
    f61: Int;
    f62: Int;
    f63: Int;
    f64: Int;
    f65: Int;
    f66: Int;
    f67: Int;
    f68: Int;
    f69: Int;
    f70: Int;
    f71: Int;
    f72: Int;
    f73: Int;
    f74: Int;
    f75: Int;
    f76: Int;
    f77: Int;
    f78: Int;
    f79: Int;
    f80: Int;
    f81: Int;
    f82: Int;
    f83: Int;
    f84: Int;
    f85: Int;
    f86: Int;
    f87: Int;
    f88: Int;
    f89: Int;
    f90: Int;
    f91: Int;
    f92: Int;
    f93: Int;
    f94: Int;
    f95: Int;
    f96: Int;
    f97: Int;
    f98: Int;
    f99: Int;
    f100: Int;
}

contract FatStorage {
    data: OneHundredFields;

    init() {
        self.data = OneHundredFields{
            f01:1,f02:2,f03:3,f04:4,f05:5,f06:6,f07:7,f08:8,f09:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,f16:16,f17:17,f18:18,f19:19,f20:20,
            f21:21,f22:22,f23:23,f24:24,f25:25,f26:26,f27:27,f28:28,f29:29,f30:30,
            f31:31,f32:32,f33:33,f34:34,f35:35,f36:36,f37:37,f38:38,f39:39,f40:40,
            f41:41,f42:42,f43:43,f44:44,f45:45,f46:46,f47:47,f48:48,f49:49,f50:50,
            f51:51,f52:52,f53:53,f54:54,f55:55,f56:56,f57:57,f58:58,f59:59,f60:60,
            f61:61,f62:62,f63:63,f64:64,f65:65,f66:66,f67:67,f68:68,f69:69,f70:70,
            f71:71,f72:72,f73:73,f74:74,f75:75,f76:76,f77:77,f78:78,f79:79,f80:80,
            f81:81,f82:82,f83:83,f84:84,f85:85,f86:86,f87:87,f88:88,f89:89,f90:90,
            f91:91,f92:92,f93:93,f94:94,f95:95,f96:96,f97:97,f98:98,f99:99,f100:100
        };
    }
}
