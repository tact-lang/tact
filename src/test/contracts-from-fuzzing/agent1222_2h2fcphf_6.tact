struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOptional {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            a: null,
            b: true,
            c: null
        };
    }
}