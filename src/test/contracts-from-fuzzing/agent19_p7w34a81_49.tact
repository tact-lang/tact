struct Counted {
    number: Int;
}

contract MultiAssigns {
    c1: Counted;
    c2: Counted;
    c3: Counted;

    init() {
        self.c1 = Counted{ number: 1 };
        self.c2 = Counted{ number: 2 };
        self.c3 = Counted{ number: 3 };
    }
}