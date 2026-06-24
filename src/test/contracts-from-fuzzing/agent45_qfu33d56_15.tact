struct InnerNested {
    i: Int;
    b: Bool?;
}

struct OuterNested {
    x: Int;
    inner: InnerNested?;
}

contract OptNestedOptionals {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            x:0,
            inner:null
        };
    }
}