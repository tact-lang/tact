struct InnerStruct {
    foo: Int;
    bar: Bool;
}

struct OuterStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
    optInner: InnerStruct?;
}

contract MultiNestedContract {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            inner1: InnerStruct{ foo: 1, bar: true },
            inner2: InnerStruct{ foo: 2, bar: false },
            optInner: null
        };
    }
}
