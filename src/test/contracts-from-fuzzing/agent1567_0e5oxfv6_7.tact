struct InnerStruct {
    value: Int;
    flag: Bool;
}

struct OptionalStructs {
    first: InnerStruct?;
    second: InnerStruct?;
}

contract OptionalFields {
    data: OptionalStructs;

    init() {
        self.data = OptionalStructs{
            first: null,
            second: null,
        };
    }
}