struct OptionalStruct {
    a: Int?;
    b: Bool? = false;
    c: Int;
    d: Bool;
}

contract OptionalDefaults {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            c: 33,
            d: true
        };
    }
}