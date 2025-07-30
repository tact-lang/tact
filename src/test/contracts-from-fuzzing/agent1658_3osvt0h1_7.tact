struct OptionNested {
    deep: Int?;
}

contract OptionNestedTest {
    field: OptionNested;

    init() {
        self.field = OptionNested{ deep: null };
    }
}