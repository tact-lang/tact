struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructPersist {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}