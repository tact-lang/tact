struct A { x: Int as uint8; }
struct B { y: Int as int64; }
struct C { z: Int as coins; }

struct Combo {
    a: A;
    b: B;
    c: C;
}

contract MultiSerialNest {
    combo: Combo = Combo{
        a: A{ x: 200 },
        b: B{ y: -1000000 },
        c: C{ z: 5000000 }
    };
}