struct Outer {
    inner: Inner;
    s: String;
}

struct Inner {
    flag: Bool;
    number: Int;
}

contract MultipleStructNesting {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                number:123
            },
            s: "foo"
        };
    }
}
