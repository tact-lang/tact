struct Inner {
    foo: Int;
    optField: String? = null;
}

struct Outer {
    optInner: Inner? = null;
    bar: Bool = false;
}

contract DefaultOptionalNested {
    data: Outer;

    init() {
        self.data = Outer{
            optInner: Inner{
                foo: 7,
                optField: "hello",
            },
            bar: true
        };
    }
}