struct Wrapper {
    s: String;
}

struct Outer {
    inner: Wrapper;
    num: Int;
    yes: Bool;
}

contract NestedStrings {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Wrapper{ s: "hello" },
            num: 99,
            yes: true,
        };
    }
}
