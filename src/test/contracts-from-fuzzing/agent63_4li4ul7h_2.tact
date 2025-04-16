struct NestedOptional {
    flag: Bool?;
    text: String;
}

contract OptionalStructField {
    data: NestedOptional;

    init() {
        self.data = NestedOptional { flag: null, text: "hello" };
    }
}
