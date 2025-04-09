struct Inner {
    a: Int?;
    b: String;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract NestedOptionalTest {
    store: Outer;

    init() {
        self.store = Outer{
            inner: Inner{
                a: null,
                b: "hello",
            },
            flag: true,
        };
    }
}
