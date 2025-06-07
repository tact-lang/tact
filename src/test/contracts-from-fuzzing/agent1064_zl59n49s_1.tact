struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    num: Int;
    optionalField: Int?;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                num: 123,
                optionalField: null,
            },
        };
    }
}