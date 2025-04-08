// serialization width mismatch stress
struct Widths {
    u3: Int as uint3;
    u19: Int as uint19;
    i9: Int as int9;
    i255: Int as int255;
}

contract Test {
    val: Widths;
    init() {
        self.val = Widths{ u3:7, u19:500000, i9:-100, i255:-123456789 };
    }
}
