struct StructWithNullDefault {
    text: String? = null;
    num: Int;
}

contract DefaultNullOptionalNested {
    s: StructWithNullDefault;

    init() {
        self.s = StructWithNullDefault{
            num: 5
        };
    }
}