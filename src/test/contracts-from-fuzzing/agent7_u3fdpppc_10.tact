struct List8 {
    a0:Int; a1:Int; a2:Int; a3:Int; a4:Int; a5:Int; a6:Int; a7:Int;
}

struct List16 {
    a0:Int; a1:Int; a2:Int; a3:Int; a4:Int; a5:Int; a6:Int; a7:Int;
    a8:Int; a9:Int; a10:Int; a11:Int; a12:Int; a13:Int; a14:Int; a15:Int;
}

contract LargeStructs {
    s1: List8;
    s2: List16;

    init() {
        self.s1 = List8{
            a0:1,a1:2,a2:3,a3:4,a4:5,a5:6,a6:7,a7:8
        };
        self.s2 = List16{
            a0:10,a1:11,a2:12,a3:13,a4:14,a5:15,a6:16,a7:17,
            a8:18,a9:19,a10:20,a11:21,a12:22,a13:23,a14:24,a15:25
        };
    }
}