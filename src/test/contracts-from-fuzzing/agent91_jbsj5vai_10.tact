struct OptionalStructField {
    sub: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalOfStruct {
    info: OptionalStructField;

    init() {
        self.info = OptionalStructField{
            sub: null
        };
    }
}
