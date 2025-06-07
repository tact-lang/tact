struct Inner {
    flag: Bool;
    description: String;
}

struct Outer {
    value: Int;
    innerStruct: Inner;
    optInner: Inner?;
}

contract DeepNested {
    record: Outer;

    init() {
        self.record = Outer{
            value: 42,
            innerStruct: Inner{flag: true, description: "desc"},
            optInner: null,
        };
    }
}