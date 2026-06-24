struct Tiny {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
}

contract TinyBits {
    store: Tiny;

    init() {
        self.store = Tiny{ a:1, b:2, c:3 };
    }
}