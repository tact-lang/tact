struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                count: 123,
            },
        };
    }
}