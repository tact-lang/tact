struct BigStruct {
    a1: Int;  a2: Int;  a3: Int;  a4: Int;  a5: Int;  a6: Int;  a7: Int;  a8: Int;
    a9: Int;  a10: Int; a11: Int; a12: Int; a13: Int; a14: Int; a15: Int; a16: Int;
    a17: Int; a18: Int; a19: Int; a20: Int; a21: Int; a22: Int; a23: Int; a24: Int;
    a25: Int; a26: Int; a27: Int; a28: Int; a29: Int; a30: Int; a31: Int; a32: Int;
    b1: Int;  b2: Int;  b3: Int;  b4: Int;  b5: Int;  b6: Int;  b7: Int;  b8: Int;
    b9: Int;  b10: Int; b11: Int; b12: Int; b13: Int; b14: Int; b15: Int; b16: Int;
    b17: Int; b18: Int; b19: Int; b20: Int; b21: Int; b22: Int; b23: Int; b24: Int;
    b25: Int; b26: Int; b27: Int; b28: Int; b29: Int; b30: Int; b31: Int; b32: Int;
}

contract TestContract {
    big: BigStruct;
    init() {
        self.big = BigStruct{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,a11:11,a12:12,a13:13,a14:14,a15:15,a16:16,
            a17:17,a18:18,a19:19,a20:20,a21:21,a22:22,a23:23,a24:24,a25:25,a26:26,a27:27,a28:28,a29:29,a30:30,a31:31,a32:32,
            b1:33,b2:34,b3:35,b4:36,b5:37,b6:38,b7:39,b8:40,b9:41,b10:42,b11:43,b12:44,b13:45,b14:46,b15:47,b16:48,
            b17:49,b18:50,b19:51,b20:52,b21:53,b22:54,b23:55,b24:56,b25:57,b26:58,b27:59,b28:60,b29:61,b30:62,b31:63,b32:64
        };
    }
}