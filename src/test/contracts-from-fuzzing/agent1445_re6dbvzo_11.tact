struct NestedOptional {
    val: Int?;
    text: String?;
}

contract OptionalStructField {
    data: NestedOptional?;

    init() {
        self.data = NestedOptional{
            val: 50,
            text: null,
        };
    }
}