struct InnerInner {
    x: Int;
    y: Int;
}

struct Inner {
    a: InnerInner;
    b: Int;
    c: Bool?;
}

struct Outer {
    nested: Inner;
    message: String;
}

contract DeepNestedContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            nested: Inner{
                a: InnerInner{
                    x: 11,
                    y: 22,
                },
                b: 33,
                c: null,
            },
            message: "hello",
        };
    }
}