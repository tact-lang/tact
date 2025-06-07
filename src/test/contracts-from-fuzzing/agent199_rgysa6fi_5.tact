struct OptionalInner {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructStorage {
    optData: OptionalInner;

    init() {
        self.optData = OptionalInner{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}
