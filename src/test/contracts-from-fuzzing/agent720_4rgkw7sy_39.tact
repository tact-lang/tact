struct Complex {
    id: Int;
    flag: Bool;
    text: String;
}

contract OptionalComplex {
    c1: Complex?;
    c2: Complex?;

    init() {
        self.c1 = null;
        self.c2 = null;
    }
}