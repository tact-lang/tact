struct Diary {
    note: String = "line1\nline2 \"quote\" \u03A9";
}

contract UnicodeTest {
    d: Diary;

    init() {
        self.d = Diary{};
    }

    receive() {}
}