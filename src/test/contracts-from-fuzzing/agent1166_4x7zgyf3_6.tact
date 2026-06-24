struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructStorage {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            a: null,
            b: null,
            c: null
        };
    }
}
