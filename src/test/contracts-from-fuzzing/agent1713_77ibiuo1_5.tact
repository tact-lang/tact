struct OptionalNested {
    innerText: String?;
    innerNum: Int?;
}

contract OptionalInStruct {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested{
            innerText: null,
            innerNum: 999,
        };
    }
}