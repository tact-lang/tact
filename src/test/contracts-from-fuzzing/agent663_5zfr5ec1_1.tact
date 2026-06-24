struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructStorage {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct { foo: null, bar: true };
    }
}