struct MidOptional {
    a: Int;
    b: String?;
    c: Bool;
}

contract ContractMidOpt {
    field: MidOptional;

    init() {
        self.field = MidOptional{
            a: 7,
            b: null,
            c: true
        };
    }
}
