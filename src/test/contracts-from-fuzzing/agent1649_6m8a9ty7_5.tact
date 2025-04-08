struct Inner {
    value: Int?;
    text: String?;
}

struct Outer {
    flag: Bool;
    inner: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            flag: true,
            inner: Inner{
                value: null,
                text: "hello",
            },
        };
    }
}