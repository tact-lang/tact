struct SOpt {
    val: Int?;
}

struct HasOptionals {
    sopt: SOpt?;
    normal: Int;
}

contract ContractWithOptionalStructs {
    field: HasOptionals;

    init() {
        self.field = HasOptionals {
            sopt: SOpt { val: null },
            normal: 42
        };
    }
}
