struct WrappedBool {
    v: Bool;
}

contract NestedBoolTest {
    val: WrappedBool;

    init() {
        self.val = WrappedBool{ v: false };
    }
}