struct ReorderTest {
    val1: Int;
    opt1: Bool?;
    val2: Int;
    opt2: String?;
}

contract ReorderContract {
    field: ReorderTest;
    init() {
        self.field = ReorderTest{
            val1: 1,
            opt1: null,
            val2: 2,
            opt2: "string"
        };
    }
}