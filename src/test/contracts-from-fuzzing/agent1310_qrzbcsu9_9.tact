struct MultiLayer {
    inner1: InnerStruct1;
    inner2: InnerStruct2;
}

struct InnerStruct1 {
    a: Int;
    b: Bool;
}

struct InnerStruct2 {
    s: String;
    c: Cell;
    opt: Bool?;
}

contract MultiLayerContract {
    s: MultiLayer;

    init() {
        self.s = MultiLayer{
            inner1: InnerStruct1{ a: 1, b: false },
            inner2: InnerStruct2{ s: "x", c: emptyCell(), opt: null }
        };
    }
}