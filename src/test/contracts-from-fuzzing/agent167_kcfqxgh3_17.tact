struct Under {
    x: Int?;
    y: Bool;
}

contract OptionalNestedStructField {
    st: Under?;
    flag: Bool = true;

    init() {
        self.st = Under{x: 101, y: false};
    }
}