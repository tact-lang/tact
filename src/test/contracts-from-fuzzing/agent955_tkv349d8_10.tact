struct OptionalStringWrap {
    val: String?;
}

struct OptionalWrapper {
    wrap: OptionalStringWrap?;
}

contract OptionalWrapTest {
    data: OptionalWrapper;

    init() {
        self.data = OptionalWrapper{
            wrap: null
        };
    }
}