struct BoolWrapper {
    flag: Bool;
}

contract BoolTest {
    wrapper: BoolWrapper?;
    init() {
        self.wrapper = null;
    }
}