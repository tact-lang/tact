// nested struct fields with serialization attributes
struct Inner {
    a: Int as uint8;
    b: Int as int16;
}

struct Outer {
    x: Inner;
    y: Int as uint64;
}

contract SerializeTest {
    data: Outer;
    init() {
        self.data = Outer{
            x: Inner{ a: 5, b: -123 },
            y: 1234567
        };
    }
}
