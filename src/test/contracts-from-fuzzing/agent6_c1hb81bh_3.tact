struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract TestStorage {
    optional: OptionalInner?;

    init() {
        self.optional = OptionalInner{
            foo: 10,
            bar: true
        };
    }
}
