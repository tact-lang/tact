struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}