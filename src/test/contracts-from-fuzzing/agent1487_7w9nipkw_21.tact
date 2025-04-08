struct ZeroDefaults {
    a: Int;
    b: Int;
    c: Int;
}

contract MissingDefaults {
    val: ZeroDefaults;

    init() {
        self.val = ZeroDefaults{ a: 1, b: 2, c: 3 };
    }
}