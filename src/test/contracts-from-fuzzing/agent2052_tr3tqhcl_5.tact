struct NestedOptionals {
    first: Int?;
    second: String?;
    third: Bool?;
}

contract NestedOptionalFieldsTest {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            first: null,
            second: "hi",
            third: null
        };
    }
}