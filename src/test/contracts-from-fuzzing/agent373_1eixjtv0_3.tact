struct NestedOptional {
    val: Int?;
    label: String?;
}

contract OptionalTest {
    data: NestedOptional?;

    init() {
        self.data = NestedOptional{
            val: 77,
            label: "abc"
        };
    }
}