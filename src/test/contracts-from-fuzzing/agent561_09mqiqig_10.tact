struct LayerA {
    int1: Int;
    bool1: Bool;
    str1: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract Test {
    f: LayerA;

    init() {
        self.f = LayerA{
            int1: 1,
            bool1: false,
            str1: "hi",
            optInt: null,
            optBool: null,
            optStr: null,
        };
    }
}