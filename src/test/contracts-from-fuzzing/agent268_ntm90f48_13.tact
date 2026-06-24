struct OptionalStruct {
    sub: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Int;
}

contract OptionalStructField {
    f: OptionalStruct;
    init() {
        self.f = OptionalStruct{ sub: null };
    }
}