struct HasString {
    s: String;
}

contract StringStructField {
    d: HasString;
    init() {
        self.d = HasString{s:"hello"};
    }
}