struct NestedOptional {
    val: Int?;
    name: String;
}

contract NullableStructField {
    data: NestedOptional?;
    flag: Bool;

    init() {
        self.data = null;
        self.flag = true;
    }
}