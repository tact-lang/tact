struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    i: Int;
    s: String;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                i: 1,
                s: "hello",
            },
            flag: false,
        };
    }
}