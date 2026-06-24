struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract OptionTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ x: null, y: true };
    }
}