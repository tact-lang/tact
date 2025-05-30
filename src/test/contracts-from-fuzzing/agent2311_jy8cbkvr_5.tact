struct HasOptional {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptStruct {
    record: HasOptional;

    init() {
        self.record = HasOptional{
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}