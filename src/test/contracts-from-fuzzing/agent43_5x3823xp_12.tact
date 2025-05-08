struct Simple {
    x: Int;
}

contract OptionalStructField {
    s: Simple?;

    init() {
        self.s = null;
    }
}
