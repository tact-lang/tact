struct NullableStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract TestContract {
    storage: NullableStruct;

    init() {
        self.storage = NullableStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
