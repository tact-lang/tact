struct OptionalInStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptStructPersist {
    sfield: OptionalInStruct;

    init() {
        self.sfield = OptionalInStruct{
            foo: null,
            bar: true,
            baz: null
        };
    }
}