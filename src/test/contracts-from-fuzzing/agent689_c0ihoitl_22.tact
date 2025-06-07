struct OptionalStrWrap {
    str: String?;
}

contract OptionalInStructTest {
    val: OptionalStrWrap;

    init() {
        self.val = OptionalStrWrap{ str: null };
    }
}