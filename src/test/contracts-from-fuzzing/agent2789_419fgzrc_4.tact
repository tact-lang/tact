struct WithOptional {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract OptionalStructFieldTest {
    data: WithOptional;

    init() {
        self.data = WithOptional{
            optInt: null,
            optStr: null,
            optBool: true
        };
    }
}
