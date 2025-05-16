struct SOpt {
    x: Int?;
}

struct S {
    opt: SOpt;
}

contract NestedWithOptional {
    s: S;
    init() {
        self.s = S{ opt: SOpt{ x: null } };
    }
}