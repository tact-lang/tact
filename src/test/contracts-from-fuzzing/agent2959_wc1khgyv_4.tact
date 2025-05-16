struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    s1: S1;
    f3: Int?;
}

contract OptionInsideNested {
    state: S2;

    init() {
        self.state = S2{
            s1: S1{f1: 5, f2: true},
            f3: null
        };
    }
}