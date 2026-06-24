struct S {
    f1: Int?;
    f2: Int?;
    f3: Int?;
}

contract AllOptionals {
    s: S;

    init() {
        self.s = S{
            f1: null,
            f2: null,
            f3: null
        };
    }
}
