struct Inner {
    s: String;
    b: Bool?;
}

struct Outer {
    num: Int;
    nested: Inner;
}

contract OptionalNestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            num: 5,
            nested: Inner{
                s: "hello",
                b: null,
            },
        };
    }
}
