struct S {
    s1: S1;
    s2: S2;
}

struct S1 {
    val: Int?;
}

struct S2 {
    txt: String?;
}

contract NestedOptional {
    field: S;

    init() {
        self.field = S{
            s1: S1{ val: null },
            s2: S2{ txt: "Ok" },
        };
    }
}
