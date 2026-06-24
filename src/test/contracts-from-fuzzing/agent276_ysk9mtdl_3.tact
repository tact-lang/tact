struct InnerMost {
    flag: Bool;
}

struct Inner {
    number: Int;
    innerMost: InnerMost;
}

struct Outer {
    name: String;
    optInner: Inner?;
}

contract DeepNestedOptional {
    data: Outer;

    init() {
        self.data = Outer{
            name: "deep",
            optInner: null
        };
    }
}
