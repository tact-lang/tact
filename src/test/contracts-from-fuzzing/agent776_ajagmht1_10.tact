struct OptionString {
    s: String?;
}

contract StringOptTest {
    f: OptionString;
    init() {
        self.f = OptionString{ s: null };
    }
}
