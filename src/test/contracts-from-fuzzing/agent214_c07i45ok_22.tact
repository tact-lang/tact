struct BigOne {
    a0: Int; a1: Int; a2: Int; a3: Int; a4: Int;
    a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
    a10: Int; a11: Int; a12: Int; a13: Int; a14: Int;
    a15: Int; a16: Int; a17: Int; a18: Int; a19: Int;
    a20: Int; a21: Int; a22: Int; a23: Int; a24: Int;
    a25: Int; a26: Int; a27: Int; a28: Int; a29: Int;
    a30: Int; a31: Int; a32: Int; a33: Int; a34: Int;
    a35: Int; a36: Int; a37: Int; a38: Int; a39: Int;
    a40: Int; a41: Int; a42: Int; a43: Int; a44: Int;
    a45: Int; a46: Int; a47: Int; a48: Int; a49: Int;
    a50: Int; a51: Int; a52: Int; a53: Int; a54: Int;
}

contract TestContract {
    big: BigOne;

    init() {
        self.big = BigOne{
            a0:0,a1:1,a2:2,a3:3,a4:4,
            a5:5,a6:6,a7:7,a8:8,a9:9,
            a10:10,a11:11,a12:12,a13:13,a14:14,
            a15:15,a16:16,a17:17,a18:18,a19:19,
            a20:20,a21:21,a22:22,a23:23,a24:24,
            a25:25,a26:26,a27:27,a28:28,a29:29,
            a30:30,a31:31,a32:32,a33:33,a34:34,
            a35:35,a36:36,a37:37,a38:38,a39:39,
            a40:40,a41:41,a42:42,a43:43,a44:44,
            a45:45,a46:46,a47:47,a48:48,a49:49,
            a50:50,a51:51,a52:52,a53:53,a54:54,
        };
    }
}