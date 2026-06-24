struct S1 {
    f1: Int;
    optf2: Int?;
}

struct S2 {
    nested1: S1;
    nested2: S1;
    optnested: S1?;
    val3: Int;
}

contract MultipleNested {
    state: S2;

    init() {
        self.state = S2{
            nested1: S1{f1:1, optf2: null},
            nested2: S1{f1:2, optf2: 3},
            optnested: null,
            val3: 5,
        };
    }
}