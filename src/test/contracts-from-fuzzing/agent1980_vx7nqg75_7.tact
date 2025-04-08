struct NestedOptional {
    val: Int?;
    flag: Bool?;
}

contract OptionalStructField {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}