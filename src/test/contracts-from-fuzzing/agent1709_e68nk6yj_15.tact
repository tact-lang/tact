struct ManyOptionalStructs {
    one: OptionalStruct?;
    two: OptionalStruct?;
    three: OptionalStruct?;
}

contract OptStructFields {
    data: ManyOptionalStructs;
    init() {
        self.data = ManyOptionalStructs{
            one: null,
            two: null,
            three: null,
        };
    }
}

struct OptionalStruct {
    a: Int;
    b: String;
}