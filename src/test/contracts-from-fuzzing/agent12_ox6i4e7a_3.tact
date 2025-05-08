struct Inner {
    flag: Bool;
    number: Int;
}

struct Outer {
    inner: Inner;
    message: String;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                number: 5,
            },
            message: "hi",
        };
    }

    receive() {
        self.data.inner.number = 12345;
    }
}
