struct EmptyStringTest {
    text: String;
}

contract EmptyTextField {
    s: EmptyStringTest;
    init() {
        self.s = EmptyStringTest{text: ""};
    }
}