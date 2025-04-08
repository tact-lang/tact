struct BigDefaults {
    a: Int = 1; b: Int = 2; c: Int = 3; d: Int = 4; e: Int = 5;
    f: Int = 6; g: Int =7; h: Int = 8; i: Int = 9; j: Int = 10;
}

contract TestContract {
    bigDef: BigDefaults;

    init() {
        self.bigDef = BigDefaults{
            a: 100, b: 101, c: 102, d: 103, e:104,
            f:105, g:106, h:107, i:108, j:109
        };
    }
}