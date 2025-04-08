struct S1 {
    x: Int?;
    y: String;
}

struct S2 {
    s1: S1?;
    flag: Bool;
}

contract NestedOptionalHybrid {
    field: S2;

    init() {
        self.field = S2{
            s1: null,
            flag: false
        };
    }
}
