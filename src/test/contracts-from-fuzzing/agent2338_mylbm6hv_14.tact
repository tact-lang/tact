struct ComplexOptional {
    text: String?;
    num: Int?;
    flag: Bool;
    nestedS: OptionalS?;
}

struct OptionalS {
    a: Int?;
    b: Bool?;
}

contract OptionalStructs {
    field: ComplexOptional;

    init() {
        self.field = ComplexOptional{
            text: null,
            num: null,
            flag: false,
            nestedS: null
        };
    }
}