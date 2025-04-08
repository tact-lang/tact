struct OptionalSub {
    text: String?;
    n: Int?;
}

contract OptTest {
    field: OptionalSub;

    init() {
        self.field = OptionalSub{
            text: null,
            n: null
        };
    }
}