struct NestedOptional {
    data: String?;
    count: Int;
}

contract OptStructField {
    record: NestedOptional;

    init() {
        self.record = NestedOptional{
            data: null,
            count: 0,
        };
    }
}