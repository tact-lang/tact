struct MostlyOptional {
    intOpt: Int?;
    strOpt: String?;
    boolOpt: Bool?;
    intField: Int;
    boolField: Bool;
    strOpt2: String?;
    intOpt2: Int?;
}

contract OptionalHeavy {
    data: MostlyOptional;

    init() {
        self.data = MostlyOptional{
            intOpt: null,
            strOpt: "hello",
            boolOpt: null,
            intField: 77,
            boolField: true,
            strOpt2: null,
            intOpt2: -5
        };
    }
}