struct NestedStruct {
    val: Int = 99;
    flag: Bool = true;
}

contract DefaultNested {
    s: NestedStruct = NestedStruct{};

    init() {
        self.s = NestedStruct{};
    }
}
