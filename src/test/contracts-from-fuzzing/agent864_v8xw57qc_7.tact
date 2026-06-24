struct Huge {
    a0: Int;  a1: Int;  a2: Int;  a3: Int;  a4: Int;
    a5: Int;  a6: Int;  a7: Int;  a8: Int;  a9: Int;
    a10: Int; a11: Int; a12: Int; a13: Int; a14: Int;
    a15: Int; a16: Int; a17: Int; a18: Int; a19: Int;
}

contract ManyFields {
    data: Huge;
    init() {
        self.data = Huge{
            a0:0,a1:1,a2:2,a3:3,a4:4,
            a5:5,a6:6,a7:7,a8:8,a9:9,
            a10:10,a11:11,a12:12,a13:13,a14:14,
            a15:15,a16:16,a17:17,a18:18,a19:19
        };
    }
    receive() {
        self.data = Huge{
            a0:20,a1:21,a2:22,a3:23,a4:24,
            a5:25,a6:26,a7:27,a8:28,a9:29,
            a10:30,a11:31,a12:32,a13:33,a14:34,
            a15:35,a16:36,a17:37,a18:38,a19:39
        };
    }
}