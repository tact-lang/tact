struct NestedOptional {
    x: Int?;
    y: String?;
}

contract OptionalTest {
    value: NestedOptional;

    init() {
        self.value = NestedOptional{
            x: null,
            y: "hello"
        };
    }
}