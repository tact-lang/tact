struct InnerInner {
    flag: Bool;
    number: Int;
}

struct Inner {
    nested: InnerInner;
    text: String;
}

struct Outer {
    deepStruct: Inner;
    optDeepStruct: Inner?;
}

contract NestedStructs {
    state: Outer;
    init() {
        self.state = Outer{
            deepStruct: Inner{
                nested: InnerInner{ flag: true, number: 7 },
                text: "hello"
            },
            optDeepStruct: null
        };
    }
}