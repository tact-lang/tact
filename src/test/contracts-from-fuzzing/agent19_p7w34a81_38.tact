struct IntLayer {
    val: Int;
}
struct BoolLayer {
    val: Bool;
}
struct StrLayer {
    val: String;
}

struct Chain {
    intL: IntLayer;
    boolL: BoolLayer;
    strL: StrLayer;
}

contract VariantChain {
    data: Chain;

    init() {
        self.data = Chain{
            intL: IntLayer{ val: 1 },
            boolL: BoolLayer{ val: true },
            strL: StrLayer{ val: "str" },
        };
    }
}