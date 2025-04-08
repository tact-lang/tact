struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalHolder {
    info: OptionalStruct;
    init() {
        self.info = OptionalStruct{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}