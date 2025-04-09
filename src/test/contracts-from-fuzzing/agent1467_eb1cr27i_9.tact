struct OptionString {
    s: String?;
}

contract DefaultOptString {
    param: OptionString;
    init() {
        self.param = OptionString{ s: null };
    }
}