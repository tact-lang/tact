struct LongList {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
    a11: Int; a12: Int; a13: Int; a14: Int; a15: Int;
    a16: Int; a17: Int; a18: Int; a19: Int; a20: Int;
}

contract LongStructFields {
    s: LongList = LongList{
        a1:1,a2:2,a3:3,a4:4,a5:5,
        a6:6,a7:7,a8:8,a9:9,a10:10,
        a11:11,a12:12,a13:13,a14:14,a15:15,
        a16:16,a17:17,a18:18,a19:19,a20:20
    };

    init() {
        self.s = LongList{
            a1:10,a2:20,a3:30,a4:40,a5:50,
            a6:60,a7:70,a8:80,a9:90,a10:100,
            a11:110,a12:120,a13:130,a14:140,a15:150,
            a16:160,a17:170,a18:180,a19:190,a20:200
        };
    }
}