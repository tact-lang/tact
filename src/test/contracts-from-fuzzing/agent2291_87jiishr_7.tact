struct NestedOptionalStruct {
    nested: Int?;
}

contract DefaultedAndOptional {
    s: NestedOptionalStruct = NestedOptionalStruct{
        nested: null
    };
    flag: Bool? = false;

    init() {
        self.s = NestedOptionalStruct{nested: 42};
        self.flag = true;
    }
}
