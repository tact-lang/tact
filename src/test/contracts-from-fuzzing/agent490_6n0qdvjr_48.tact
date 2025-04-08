struct SimpleWrap {
    s: String;
}

struct NestedWrap {
    wrap: SimpleWrap;
}

contract ComplexWrap {
    n: NestedWrap;
    init() {
        self.n = NestedWrap{ wrap: SimpleWrap{s:"hello"} };
    }
}