struct Combi {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract SetDefaultsOpt {
    c: Combi = Combi{
        intOpt: null,
        boolOpt: null,
        strOpt: null
    };
}