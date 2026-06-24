struct OptionalInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptionalFieldPersist {
    store: OptionalInStruct;
    init() {
        self.store = OptionalInStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}