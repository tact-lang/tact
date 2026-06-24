struct Simple {
    x: Int;
    y: Int;
}

contract OptionalStructField {
    s: Simple?;

    init() {
        self.s = null;
    }
}