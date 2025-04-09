struct SDeep {
    level1: S2;
}

struct S2 {
    level2: S3;
}

struct S3 {
    level3: S4;
}

struct S4 {
    level4: S5;
}

struct S5 {
    x: Int;
}

contract TestContract {
    s: SDeep;

    init() {
        self.s = SDeep{ level1: S2{ level2: S3{ level3: S4{ level4: S5{ x: 123 } } } } };
    }
}