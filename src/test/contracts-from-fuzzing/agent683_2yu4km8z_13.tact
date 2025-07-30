struct OneField {
    x: Int;
}

contract ArrayLike {
    a: OneField;
    b: OneField;
    c: OneField;
    d: OneField;
    e: OneField;

    init() {
        self.a = OneField{ x: 1 };
        self.b = OneField{ x: 2 };
        self.c = OneField{ x: 3 };
        self.d = OneField{ x: 4 };
        self.e = OneField{ x: 5 };
    }
}