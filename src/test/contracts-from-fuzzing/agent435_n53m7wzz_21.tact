struct SIntDefault {
    a: Int = 5;
    b: Int = -1;
    c: Int;
}

contract DefIntPersists {
    s: SIntDefault;

    init() {
        self.s = SIntDefault{
            a: 55,
            b: -11,
            c: 42
        };
    }
}