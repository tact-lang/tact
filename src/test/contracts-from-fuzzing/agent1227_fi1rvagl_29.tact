message(12) TestM {}

contract OptionalMsgField {
    m: TestM?;
    init() {
        self.m = null;
    }
}
