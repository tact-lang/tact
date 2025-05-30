struct Nested {
    a: Int;
    b: Bool;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: String;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            a: 1,
            b: true,
            inner: Inner{
                x: 2,
                y: "hello"
            }
        };
    }
}