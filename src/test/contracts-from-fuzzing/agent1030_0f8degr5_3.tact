struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Cell?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: true,
            c: null,
        };
    }
}