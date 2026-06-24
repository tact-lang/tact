struct MultiLayer {
    first: Int;
    second: L2;
}

struct L2 {
    a: Bool;
    b: L3;
}

struct L3 {
    x: String;
    y: Bool?;
}

contract MultiLayerContract {
    big: MultiLayer;

    init() {
        self.big = MultiLayer{
            first: 42,
            second: L2{
                a: true,
                b: L3{
                    x: "deep",
                    y: null
                }
            }
        };
    }
}