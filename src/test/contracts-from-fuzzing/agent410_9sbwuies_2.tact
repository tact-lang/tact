struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: Inner;
    c: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 123,
                b: true,
            },
            c: "hello",
        };
    }
}
