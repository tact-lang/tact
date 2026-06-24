struct Wide1 {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
}

struct Wide2 {
    b1: Int; b2: Int; b3: Int; b4: Int; b5: Int;
    b6: Int; b7: Int; b8: Int; b9: Int; b10: Int;
}

contract TestContract {
    w1: Wide1;
    w2: Wide2;

    init() {
        self.w1 = Wide1{ a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10 };
        self.w2 = Wide2{ b1:11,b2:12,b3:13,b4:14,b5:15,b6:16,b7:17,b8:18,b9:19,b10:20 };
    }
}