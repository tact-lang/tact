struct DeepList {
    s1: S1;
}

struct S1 {
    s2: S2;
    s2Opt: S2?;
}

struct S2 {
    a: Int;
    b: Bool;
}

contract TestContract {
    field: DeepList;
    init() {
        self.field = DeepList{
            s1: S1{
                s2: S2{ a: 1, b: false },
                s2Opt: null,
            },
        };
    }
}