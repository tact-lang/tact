struct OptionalNest {
    val: Int?;
    text: String?;
}

contract OptTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            val: null,
            text: null,
        };
    }
}