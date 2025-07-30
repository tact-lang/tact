struct Simple {
    i: Int;
}

contract OptionalStructField {
    st: Simple?;

    init() {
        self.st = null;
    }
}