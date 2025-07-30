struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract DeepOptionals {
    a: Nested?;
    b: Nested?;
    c: Nested?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
