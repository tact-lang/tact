struct MultiOptionals {
    foo: Int?;
    bar: String?;
    baz: Bool?;
    addr: Address?;
}

contract DeepOptionalFields {
    m: MultiOptionals;

    init() {
        self.m = MultiOptionals{
            foo: null,
            bar: null,
            baz: null,
            addr: null,
        };
    }
}