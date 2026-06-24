struct HasBool {
    x: Bool;
    y: Bool?;
}

contract StructBoolTest {
    val: HasBool;

    init() {
        self.val = HasBool{ x: true, y: null };
    }
}