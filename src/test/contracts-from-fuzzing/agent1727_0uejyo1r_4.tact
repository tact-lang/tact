struct NestedOptional {
    val: Int?;
    txt: String?;
}

contract OptionalNestedFields {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            val: null,
            txt: "testing",
        };
    }
}
