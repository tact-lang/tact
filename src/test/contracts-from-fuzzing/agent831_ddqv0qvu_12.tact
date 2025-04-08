struct OptionalStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract Test {
    nested: OptionalStruct;

    init() {
        self.nested = OptionalStruct{
            a: null,
            b: true,
            s: null
        };
    }
}