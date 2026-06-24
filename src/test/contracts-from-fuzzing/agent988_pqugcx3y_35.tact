struct SOnce { val: Int; }

contract ManySames {
    a: SOnce;
    b: SOnce;
    c: SOnce;

    init() {
        self.a = SOnce{ val: 1 };
        self.b = SOnce{ val: 2 };
        self.c = SOnce{ val: 3 };
    }
}