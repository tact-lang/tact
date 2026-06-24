struct OptIntStruct {
    v: Int?;
}

contract OptStructDefaultNull {
    s: OptIntStruct = OptIntStruct{ v: null };

    init() {
        self.s = OptIntStruct{ v: 123 };
    }
}