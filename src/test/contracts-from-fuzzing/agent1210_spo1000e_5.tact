struct OptionalNested {
    val1: Int?;
    val2: Bool?;
}

contract OptTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ val1: null, val2: true };
    }
}