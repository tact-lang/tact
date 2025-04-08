message(77) TestMsg {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    v4: Address?;
}

contract OptionalMsgCont {
    state: TestMsg?;

    init() {
        self.state = null;
    }
}