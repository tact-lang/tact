struct InnerMost {
    foo: Int;
    bar: Bool;
}

struct Inner {
    nested: InnerMost;
    note: String?;
}

struct Outer {
    id: Int;
    inner: Inner;
    flag: Bool?;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            id: 9,
            inner: Inner{
                nested: InnerMost{ foo: 11, bar: true },
                note: "note"
            },
            flag: null,
        };
    }
}