struct Inner {
    innerVal: Int;
}

struct Outer {
    nested: Inner;
    s: String;
    flag: Bool;
}

contract NestedStructTest {
    store: Outer;

    init() {
        self.store = Outer{
            nested: Inner{innerVal: 42},
            s: "hello",
            flag: true,
        };
    }
}
