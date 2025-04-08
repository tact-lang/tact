struct WithOptional {
    num: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalTest {
    optField: WithOptional;
    init() {
        self.optField = WithOptional{num: null, flag: true, text: null};
    }
}
