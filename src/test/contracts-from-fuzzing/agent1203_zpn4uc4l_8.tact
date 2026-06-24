struct ContainsString {
    field1: String;
    field2: String;
}

contract StringFields {
    val: ContainsString;

    init() {
        self.val = ContainsString{field1: "hello", field2: "world"};
    }
}