struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Cell?;
    e: String?;
    f: Address?;
}

contract OptionalStructContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
