struct StrAndBool {
    s: String;
    b: Bool;
}

contract StrBoolTest {
    data: StrAndBool;

    init() {
        self.data = StrAndBool{s: "hi", b: false};
    }
}