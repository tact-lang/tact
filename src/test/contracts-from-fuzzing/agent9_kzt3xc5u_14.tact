struct ContainString {
    val: String;
}

contract StringField {
    data: ContainString;

    init() {
        self.data = ContainString{ val: "hello world" };
    }
}