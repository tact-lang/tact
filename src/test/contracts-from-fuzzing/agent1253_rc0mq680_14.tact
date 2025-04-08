struct OptionalBool {
    flag: Bool?;
}

contract OptionalBoolTest {
    val: OptionalBool;

    init() {
        self.val = OptionalBool{flag: null};
    }
}
