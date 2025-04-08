struct MultiOptional {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract Options {
    first: MultiOptional;
    second: MultiOptional;

    init() {
        self.first = MultiOptional{
            intOpt: 10,
            boolOpt: null,
            stringOpt: "aa"
        };
        self.second = MultiOptional{
            intOpt: null,
            boolOpt: true,
            stringOpt: null
        };
    }
}