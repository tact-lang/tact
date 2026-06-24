struct HasString {
    msg: String;
    count: Int;
}

contract StringStructField {
    s: HasString;

    init() {
        self.s = HasString{
            msg: "abcd",
            count: 2
        };
    }
}
