struct InnerSpec {
    x: Int as uint8;
    y: Int as int16;
}
struct OuterSpec {
    a: Int as uint32;
    b: InnerSpec;
}

contract SerializeTest {
    data: OuterSpec;

    init() {
        self.data = OuterSpec{
            a: 1000,
            b: InnerSpec{ x: 10, y: -123 }
        };
    }
}