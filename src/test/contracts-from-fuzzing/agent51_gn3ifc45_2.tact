struct Nested {
    a: Int;
    b: Int?;
}

struct Wrapper {
    inner: Nested;
    flag: Bool?;
}

contract DeepOptional {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            inner: Nested{ a: 7, b: null },
            flag: null,
        };
    }
}
