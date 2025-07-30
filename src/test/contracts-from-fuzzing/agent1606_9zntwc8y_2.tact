struct InnerMost {
    val: Int as uint8;
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    name: String;
    maybe: Int?;
}

contract NestedStructStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                innerMost: InnerMost{ val: 42 },
                flag: true,
            },
            name: "Deep",
            maybe: null,
        };
    }

    receive() {
        let d = self.data;
    }
}