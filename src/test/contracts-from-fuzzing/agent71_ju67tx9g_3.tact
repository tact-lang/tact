struct OptionalNested {
    value: Int?;
    label: String?;
    innerOpt: Bool?;
}

struct OuterOptStruct {
    num: Int;
    maybeNested: OptionalNested?;
}

contract OptionalInStructTest {
    field: OuterOptStruct;

    init() {
        self.field = OuterOptStruct{
            num: 42,
            maybeNested: OptionalNested{
                value: null,
                label: null,
                innerOpt: true
            }
        };
    }

    receive() {
        self.field;
    }
}