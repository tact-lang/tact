struct OptionalBoolStruct {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
}

contract OptionalBoolsStore {
    os: OptionalBoolStruct;

    init() {
        self.os = OptionalBoolStruct{
            a: null,
            b: false,
            c: null,
            d: true,
            e: null
        };
    }
}