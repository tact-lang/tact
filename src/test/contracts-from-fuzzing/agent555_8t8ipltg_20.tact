struct SimpleS {
    a: Int;
    b: Bool;
}

contract DefaultsVsInit {
    s1: SimpleS = SimpleS{ a: 1, b: false };
    s2: SimpleS;

    init() {
        self.s2 = SimpleS{ a: 2, b: true };
    }
}