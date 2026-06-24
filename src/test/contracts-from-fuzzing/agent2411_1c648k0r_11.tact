struct Triple {
    a: Int;
    b: Int;
    c: Int;
}

contract OptionalTriple {
    data: Triple?;

    init() {
        self.data = null;
    }
}