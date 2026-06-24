struct MultiLayered {
    a: Int;
    b: SecondLayer;
    c: Int;
}

struct SecondLayer {
    d: Int;
    e: ThirdLayer;
}

struct ThirdLayer {
    f: Int;
    g: String;
}

contract MultiLayerTest {
    m: MultiLayered;

    init() {
        self.m = MultiLayered{
            a: 1,
            b: SecondLayer{
                d: 2,
                e: ThirdLayer{
                    f: 3,
                    g: "text"
                }
            },
            c: 4
        };
    }
}
