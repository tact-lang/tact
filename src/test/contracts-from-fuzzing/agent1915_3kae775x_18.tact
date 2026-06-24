struct OptionWrapper {
    val: Int?;
}

contract DirectVsNestedOptional {
    a: Int?;
    b: OptionWrapper?;

    init() {
        self.a = null;
        self.b = null;
    }
}