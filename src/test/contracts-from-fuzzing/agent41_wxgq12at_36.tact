struct OptionBool {
    yes: Bool?;
}

contract OptionBoolContract {
    data: OptionBool;

    init() {
        self.data = OptionBool{ yes: null };
    }
}
