struct OptionalInnerString {
    s: String?;
}

contract OptStrInnerTest {
    s: OptionalInnerString;
    init() {
        self.s = OptionalInnerString{
            s: null
        };
    }
}
