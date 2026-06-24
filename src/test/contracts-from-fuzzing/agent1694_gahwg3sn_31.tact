struct ComplexNested {
    x: Bool;
    optNum: Int?;
    text: String;
    c: Cell?;
}

struct CWrap {
    first: ComplexNested;
    second: ComplexNested?;
}

contract MixedDepth {
    s: CWrap;

    init() {
        self.s = CWrap{
            first: ComplexNested{ x: true, optNum: null, text: "hi", c: null },
            second: null
        };
    }
}