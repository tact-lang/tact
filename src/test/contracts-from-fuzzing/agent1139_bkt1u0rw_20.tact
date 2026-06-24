struct StructWithOptionals {
    a: Int?;
    b: Bool?;
}

contract OptionalsInNestedStruct {
    s: StructWithOptionals?;

    init() {
        self.s = StructWithOptionals{
            a: 5,
            b: null
        };
    }
}