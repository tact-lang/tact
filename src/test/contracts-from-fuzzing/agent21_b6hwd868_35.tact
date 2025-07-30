struct HasString {
    s: String;
    sopt: String?;
}

contract StringFieldTest {
    f: HasString;

    init() {
        self.f = HasString{ s: "abc", sopt: null };
    }
}