struct Abstr {
    x: Int;
}

contract StructOverwrite {
    s1: Abstr;
    s2: Abstr;

    init() {
        self.s1 = Abstr{ x: 10 };
        self.s2 = self.s1;
    }
}