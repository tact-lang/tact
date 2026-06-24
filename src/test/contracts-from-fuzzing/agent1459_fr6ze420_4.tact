struct OptionalsTest {
    val1: Int?;
    val2: String?;
    val3: Bool?;
}

contract NestedOptionals {
    data: OptionalsTest;

    init() {
        self.data = OptionalsTest{
            val1: null,
            val2: "hello",
            val3: true
        };
    }
}