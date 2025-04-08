struct SSub1 { val: Int }
struct SSub2 { val: Bool }
struct SNest {
    field1: SSub1;
    field2: SSub2;
}
contract ContractNest {
    s: SNest;

    init() {
        self.s = SNest{
            field1: SSub1{ val: 42 },
            field2: SSub2{ val: true },
        };
    }
}