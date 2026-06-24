struct WithOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
}

contract OptionalFieldsTest {
    data: WithOptionals;
    init() {
        self.data = WithOptionals{
            intOpt: null,
            boolOpt: true,
            addrOpt: null,
            strOpt: "hello"
        };
    }
}