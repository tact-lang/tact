struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    number: Int;
    maybeText: String?;
}

contract DeepNestContract {
    store: Outer;

    init() {
        self.store = Outer{
            nested: Inner{ value: 42, flag: true },
            number: 7,
            maybeText: null,
        };
    }
}