struct Inner {
    foo: Int;
    optBar: Bool?;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract ComboTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            first: Inner{ foo: 1, optBar: true },
            second: Inner{ foo: 7, optBar: null }
        };
    }
}