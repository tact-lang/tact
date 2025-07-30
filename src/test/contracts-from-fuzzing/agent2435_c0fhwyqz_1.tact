struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    text: String;
    number: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                text: "hello",
                number: 123,
            }
        };
    }
}