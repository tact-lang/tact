struct InnerMost {
    foo: Int;
}

struct Inner {
    opt: InnerMost?;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    label: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                opt: null,
                flag: true,
            },
            label: "test",
        };
    }
}