struct OptionBool {
    b: Bool?;
}

contract OptionBoolContract {
    opt: OptionBool;

    init() {
        self.opt = OptionBool{ b: null };
    }
}