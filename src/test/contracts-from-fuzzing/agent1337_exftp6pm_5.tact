struct Sub {
    flag: Bool;
    comment: String;
}

contract OptionalStructField {
    sub: Sub?;

    init() {
        self.sub = null;
    }
}