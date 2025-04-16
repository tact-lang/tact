struct Complex {
    a: Int;
    b: Bool?;
    c: String;
}

contract ComplexOptional {
    data: Complex?;

    init() {
        self.data = null;
    }
}