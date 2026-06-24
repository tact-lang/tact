// Persistence of nested struct + serialized int formats
struct Inner {
    a: Int as uint8;
    b: Int as int32;
}

struct Outer {
    foo: Inner;
    bar: Int as uint4;
}

contract SerializeFormatTest {
    data: Outer;

    init() {
        self.data = Outer{
            foo: Inner{ a: 12, b: -12345 },
            bar: 8
        };
    }
}