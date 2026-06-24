struct OptIntBool {
    i: Int?;
    b: Bool?;
}

contract OptIntBoolTest {
    val: OptIntBool;

    init() {
        self.val = OptIntBool{
            i: null,
            b: true
        };
    }
}