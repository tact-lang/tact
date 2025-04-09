struct HasOptionalBool {
    flag: Bool?;
}

contract OptionalsBoolTest {
    val: HasOptionalBool;

    init() {
        self.val = HasOptionalBool{ flag: null };
    }
}