struct OptionalDeep {
    innerOpt: Int?;
}

struct NestedOptStruct {
    field1: OptionalDeep?;
}

contract OptionalInOptionalTest {
    deepOpt: NestedOptStruct;

    init() {
        self.deepOpt = NestedOptStruct{
            field1: null
        };
    }
}