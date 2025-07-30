struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}