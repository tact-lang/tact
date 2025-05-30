contract NestedOptionalWithDefaultTest {
    s: Outer;

    init() {
        self.s = Outer{
            name: "X",
            inner: null
        };
    }
}

struct Inner {
    value: Int? = null;
    flag: Bool = true;
}

struct Outer {
    name: String;
    inner: Inner?;
}