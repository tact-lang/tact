struct BigStruct {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Int as uint32;
    opt: Int?;
    nested: Inner;
}

struct Inner {
    flag: Bool;
    num: Int;
}

contract LotsOfVariety {
    state: BigStruct;
    init() {
        self.state = BigStruct{
            foo: 1,
            bar: true,
            baz: "x",
            qux: 2,
            opt: null,
            nested: Inner{ flag: false, num: -1 }
        };
    }
    receive() {
        self.state = BigStruct{
            foo: 3,
            bar: false,
            baz: "y",
            qux: 4,
            opt: 42,
            nested: Inner{ flag: true, num: 7 }
        };
    }
}