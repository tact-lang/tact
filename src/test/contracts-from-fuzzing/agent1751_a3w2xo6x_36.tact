struct OptionalBoolStruct {
    b: Bool?;
}

struct OptionalIntStruct {
    i: Int?;
}

struct OptionalStringStruct {
    s: String?;
}

contract MultiOptionalTypes {
    ob: OptionalBoolStruct;
    oi: OptionalIntStruct;
    os: OptionalStringStruct;

    init() {
        self.ob = OptionalBoolStruct{ b: null };
        self.oi = OptionalIntStruct{ i: null };
        self.os = OptionalStringStruct{ s: null };
    }
}
