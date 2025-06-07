struct Inner {
    flag: Bool;
    name: String;
}

struct Outer {
    inner: Inner;
    message: String?;
}

contract NestedWithOptional {
    store: Outer;

    init() {
        self.store = Outer{
            inner: Inner{
                flag: true,
                name: "abc"
            },
            message: null
        };
    }
}