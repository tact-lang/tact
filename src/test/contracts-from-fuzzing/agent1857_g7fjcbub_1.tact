struct InnerNest {
    a: Int;
    b: Bool?;
}

struct DeepNest {
    nest: InnerNest;
    flag: Bool;
    maybe: InnerNest?;
}

contract DeepFuzz {
    nestedField: DeepNest;

    init() {
        self.nestedField = DeepNest{
            nest: InnerNest{ a: 1, b: true },
            flag: false,
            maybe: null
        };
    }
}