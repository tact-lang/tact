struct OptionalInner {
    foo: Int?;
    bar: String?;
}

contract OptionalFields {
    nestedOpt: OptionalInner;

    init() {
        self.nestedOpt = OptionalInner{
            foo: null,
            bar: null
        };
    }
}