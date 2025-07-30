struct Inner {
    flag: Bool;
    count: Int as uint32;
    data: String;
    optionalValue: Int?;
}

contract TestNested {
    inner: Inner;

    init() {
        self.inner = Inner{
            flag: true,
            count: 123,
            data: "test",
            optionalValue: null,
        };
    }
}