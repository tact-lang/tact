struct OptionalInStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;
}

contract TestContract {
    data: OptionalInStruct;
    init() {
        self.data = OptionalInStruct {
            foo: null,
            bar: null,
            baz: null,
            addr: null
        };
    }
}