struct WithStringAndBool {
    s: String;
    b: Bool;
}

contract StrBoolTest {
    sb: WithStringAndBool = WithStringAndBool{ s: "hi", b: false };

    init() {
        self.sb = WithStringAndBool{ s: "bye", b: true };
    }
}
