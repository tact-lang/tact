struct S1 {
    f: Int?;
}

contract ContractWithOptionalStructField {
    s: S1?;

    init() {
        self.s = S1{f: null};
    }
}
