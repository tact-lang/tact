struct OptionalStruct {
    foo: Int?;
    bar: String?;
}

contract OptionalStructStorage {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ foo: null, bar: null };
    }
}