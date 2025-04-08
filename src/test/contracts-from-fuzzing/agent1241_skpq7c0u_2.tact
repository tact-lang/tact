struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    value: Int?;
    text: String;
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{
            inner: Inner{
                value: null,
                text: "hi",
            },
            flag: true,
        };
    }
}
