struct StructWithStrings {
    s1: String = "first";
    s2: String = "second";
}

contract StringNested {
    data: StructWithStrings;

    init() {
        self.data = StructWithStrings{};
    }
}