struct DeepNested {
    inner: StructLevel2;
}

struct StructLevel2 {
    inner: StructLevel3;
}

struct StructLevel3 {
    flag: Bool;
    amount: Int;
}

contract ContractDeep {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: StructLevel2{
                inner: StructLevel3{
                    flag: true,
                    amount: 42,
                },
            },
        };
    }
}
