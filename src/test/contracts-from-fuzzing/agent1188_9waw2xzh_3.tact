struct InnerMost {
    value: Int;
    flag: Bool;
}

struct Middle {
    nested: InnerMost;
    optVal: Int?;
}

struct Outer {
    mid: Middle;
    status: Bool;
}

contract DeepNestedContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: Middle{
                nested: InnerMost{value: 42, flag: true},
                optVal: null,
            },
            status: false,
        };
    }
}