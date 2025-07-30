struct OptionalOuter {
    nested: Int?;
}

contract OptionInStruct {
    value: OptionalOuter;

    init() {
        self.value = OptionalOuter{
            nested: null
        };
    }
}
