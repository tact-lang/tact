struct Info {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    data: Info?;

    init() {
        self.data = null;
    }
}