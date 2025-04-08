struct HasOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract OptionalsTest {
    optStruct: HasOptionals;

    init() {
        self.optStruct = HasOptionals{
            intOpt: null,
            boolOpt: true,
            strOpt: null,
        };
    }
}