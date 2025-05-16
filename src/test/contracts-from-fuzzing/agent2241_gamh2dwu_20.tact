struct OH {
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
}

contract OverrideDefaultFields {
    s: OH;

    init() {
        self.s = OH{
            f2: 22,
            f4: 44,
            f1: 11,
            f3: 33
        };
    }
}