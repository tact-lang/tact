struct OptionBool {
    flag: Bool?;
}

contract OptionBoolTest {
    v: OptionBool;

    init() {
        self.v = OptionBool{ flag: null };
    }
}