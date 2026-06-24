struct OptNested {
    val: Int?;
}

contract OptionalInStruct {
    nested: OptNested;

    init() {
        self.nested = OptNested{
            val: null
        };
        self.nested = OptNested{
            val: 999
        };
    }
}