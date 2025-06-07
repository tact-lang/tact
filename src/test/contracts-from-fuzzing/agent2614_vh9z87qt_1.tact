struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    name: String;
}

contract NestedStructStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                nested: InnerMost{ val: 1 },
                flag: true
            },
            name: "test"
        };
    }
}