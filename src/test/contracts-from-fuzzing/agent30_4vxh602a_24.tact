struct ComplexNesting {
   innerOpt: StructWithOptional?;
}

struct StructWithOptional {
    val: Int?;
}

contract ContractComplex {
    storage: ComplexNesting;

    init() {
        self.storage = ComplexNesting{ innerOpt: null };
    }
}