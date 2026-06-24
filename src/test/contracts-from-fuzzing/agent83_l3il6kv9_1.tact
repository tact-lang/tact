struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                num: 123
            }
        };
    }
}