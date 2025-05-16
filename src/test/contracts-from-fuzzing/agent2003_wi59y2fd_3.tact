struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: Nested;

    init() {
        self.s = Nested{
            inner: Inner{
                x: 20,
                y: false,
            },
            flag: true,
        };
    }
}
