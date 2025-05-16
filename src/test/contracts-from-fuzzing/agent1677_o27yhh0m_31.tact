struct SS2 {
    nested: SS3?;
}

struct SS3 {
    x: Int;
}

contract ContractNestedOptOpt {
    s: SS2;

    init() {
        self.s = SS2{ nested: null };
    }
}