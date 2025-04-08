struct SIntLayer {
    a: Int;
    b: InnerInt;
}

struct InnerInt {
    c: Int?;
    d: Int;
}

contract IntLayerTest {
    v: SIntLayer;

    init() {
        self.v = SIntLayer{
            a: 5,
            b: InnerInt{
                c: null,
                d: 10,
            }
        };
    }
}