struct OptionalNested {
    optVal: Int?;
}

contract OptionalInStruct {
    nestedOptField: OptionalNested;

    init() {
        self.nestedOptField = OptionalNested{
            optVal: null
        };
    }
}
