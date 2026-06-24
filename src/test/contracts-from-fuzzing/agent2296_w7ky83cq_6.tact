struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Builder?;
}

contract OptionalStructField {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}
