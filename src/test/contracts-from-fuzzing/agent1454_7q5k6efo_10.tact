struct SmallA { a: Int as uint4; }
struct SmallB { b: Int as uint1; }
struct SmallC { c: Int as uint8; }

struct PackTest {
    sa: SmallA;
    sb: SmallB;
    sc: SmallC;
}

contract PackedStructs {
    pt: PackTest;

    init() {
        self.pt = PackTest{
            sa: SmallA{a: 9},
            sb: SmallB{b: 1},
            sc: SmallC{c: 255}
        };
    }

    receive() {
        let _ = self.pt.sa.a;
    }
}