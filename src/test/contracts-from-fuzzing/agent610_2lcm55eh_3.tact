struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
}

contract OptStructStorage {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            foo: null,
            bar: true
        };
    }
}