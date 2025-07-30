struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    note: String;
}

contract DeeplyNested {
    store: Outer;

    init() {
        self.store = Outer{
            nested: Inner{ value: 9, flag: true },
            note: "deep"
        };
    }
}