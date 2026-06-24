struct Inner {
    flag: Bool;
}

struct Mid {
    inner: Inner;
    note: String?;
}

struct Outer {
    mid: Mid;
    count: Int;
}

contract DeepNestedStorage {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Mid{
                inner: Inner{flag: false},
                note: null
            },
            count: 42
        };
    }
}