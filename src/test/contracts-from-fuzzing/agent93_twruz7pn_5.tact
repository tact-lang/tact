struct InnerMost {
    val: Int;
    note: String;
}

struct Inner {
    item: InnerMost;
    flag: Bool;
}

struct Middle {
    inner: Inner;
    owner: Address;
}

struct Outer {
    mid: Middle;
    label: String;
}

contract DeepNested {
    store: Outer;

    init() {
        self.store = Outer{
            mid: Middle{
                inner: Inner{
                    item: InnerMost{
                        val: 77,
                        note: "deep",
                    },
                    flag: true,
                },
                owner: myAddress(),
            },
            label: "ok",
        };
    }
}