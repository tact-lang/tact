struct Nested {
    a: Int as uint4;
    b: Bool;
}

contract ComplexInit {
    s: Nested?;

    init() {
        self.s = null;
    }
}