struct S {
    a: Int;
    b: String?;
}

struct T {
    c: S?;
    d: S;
}

contract ContractMix {
    field: T;

    init() {
        self.field = T{c: null, d: S{a: 5, b: null}};
    }
}
