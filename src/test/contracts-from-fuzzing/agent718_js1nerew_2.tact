struct ComplexOptionalNested {
    intField: Int?;
    boolField: Bool?;
    nestedStruct: OptionalInner?;
}

struct OptionalInner {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: ComplexOptionalNested;

    init() {
        self.data = ComplexOptionalNested{
            intField: null,
            boolField: true,
            nestedStruct: OptionalInner{
                flag: false,
                num: 123
            }
        };
    }
}