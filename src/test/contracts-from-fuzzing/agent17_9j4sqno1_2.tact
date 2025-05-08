struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestFuzz {
    optStorage: OptionalStruct;

    init() {
        self.optStorage = OptionalStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}