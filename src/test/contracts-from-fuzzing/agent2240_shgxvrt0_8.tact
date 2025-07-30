struct NestedBool {
    flag: Bool;
}

contract DefaultNestedBoolTest {
    data: NestedBool;

    init() {
        self.data = NestedBool{ flag: true };
    }
}