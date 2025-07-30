struct ConflictingWidths {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint9;
}

contract MixedWidths {
    s: ConflictingWidths;

    init() {
        self.s = ConflictingWidths{ a: 200, b: -100, c: 300 };
    }
}