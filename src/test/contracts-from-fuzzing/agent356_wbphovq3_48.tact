struct Simple {
    i: Int;
}

contract OptStructField {
    nested: Simple?;

    init() {
        self.nested = null;
    }
}