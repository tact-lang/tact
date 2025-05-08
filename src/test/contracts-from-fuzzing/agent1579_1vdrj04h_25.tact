struct SOpt {
    a: Int?;
}

struct S {
    opt: SOpt?;
}

contract NestedSOpt {
    val: S;
    init() {
        self.val = S{ opt: null };
    }
}