struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool;
}

contract BoolTest {
    val: BoolDefaults;

    init() {
        self.val = BoolDefaults{
            c: true
        };
    }
}