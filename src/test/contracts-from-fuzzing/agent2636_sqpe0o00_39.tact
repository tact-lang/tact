struct StrBool {
    s: String;
    b: Bool;
}

contract StrBoolTest {
    v: StrBool;

    init() {
        self.v = StrBool{
            s: "abc",
            b: false,
        };
    }
}