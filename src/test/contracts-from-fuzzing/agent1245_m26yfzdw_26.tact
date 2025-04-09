struct Nullables {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract TestNullables {
    data: Nullables;

    init() {
        self.data = Nullables{
            intOpt: null,
            boolOpt: null,
            strOpt: null,
        };
    }
}
