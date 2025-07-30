struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract OptFields {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}