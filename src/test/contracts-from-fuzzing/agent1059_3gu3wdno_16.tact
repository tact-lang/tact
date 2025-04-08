struct BigA {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
}

struct BigB {
    b1: Int; b2: Int; b3: Int; b4: Int; b5: Int;
    b6: Int; b7: Int; b8: Int; b9: Int; b10: Int;
}

struct BigC {
    c1: Int; c2: Int; c3: Int; c4: Int; c5: Int;
    c6: Int; c7: Int; c8: Int; c9: Int; c10: Int;
}

contract BigNested {
    a: BigA;
    b: BigB;
    c: BigC;
    init() {
        self.a = BigA{ a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10 };
        self.b = BigB{ b1:1,b2:2,b3:3,b4:4,b5:5,b6:6,b7:7,b8:8,b9:9,b10:10 };
        self.c = BigC{ c1:1,c2:2,c3:3,c4:4,c5:5,c6:6,c7:7,c8:8,c9:9,c10:10 };
    }
}