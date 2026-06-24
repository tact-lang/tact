struct JustString {
    value: String;
}

contract StringContract {
    s: JustString;
    init() {
        self.s = JustString{value: "test"};
    }
}