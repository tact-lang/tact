struct OptionalsAndNesting {
    s1: S1?;
    simple: Int?;
}

struct S1 {
    s2: S2?;
}

struct S2 {
    flag: Bool;
}

contract TestContract {
    val: OptionalsAndNesting;

    init() {
        self.val = OptionalsAndNesting{
            s1: S1{ s2: null },
            simple: null
        };
    }
}