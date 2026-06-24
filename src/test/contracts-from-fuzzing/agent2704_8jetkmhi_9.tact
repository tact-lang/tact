struct Middle {
    flag: Bool;
    answer: Int;
}

contract OptionalStructField {
    maybeMid: Middle?;

    init() {
        self.maybeMid = null;
    }
}