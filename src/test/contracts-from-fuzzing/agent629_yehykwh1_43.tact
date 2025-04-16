// nested struct with serialization options
struct Inner {
    x: Int as uint32;
    y: Int as int64;
}

struct Outer {
    i: Int as int4;
    inr: Inner;
}

contract Test {
    blob: Outer;
    init() {
        self.blob = Outer{ i:7, inr: Inner{ x: 99, y: -10 } };
    }
}
