struct OptNested {
    value: Int?;
    flag: Bool;
}

struct OuterOptNested {
    inner: OptNested?;
    count: Int;
}

contract OptionalNested {
    data: OuterOptNested;

    init() {
        self.data = OuterOptNested{
            inner: null,
            count: 42,
        };
    }
}
