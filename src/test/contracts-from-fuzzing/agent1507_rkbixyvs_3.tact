struct HasOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
}

contract OptionalsTest {
    field: HasOptionals;

    init() {
        self.field = HasOptionals{
            intOpt: null,
            boolOpt: true,
            addrOpt: null,
            strOpt: "hello",
        };
    }
}
