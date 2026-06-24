struct S1 {
    a: Int;
    opt: Int?;
}

struct S2 {
    nested: S1;
    flag: Bool;
}

contract NestedOptionals {
    s: S2;

    init() {
        self.s = S2{
            nested: S1{
                a: 10,
                opt: null,
            },
            flag: true,
        };
    }
}