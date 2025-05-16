// default value containing special unicode
struct UnicodeDef {
    s: String = "🚀✨";
}

contract UnicodeDefaultTest {
    data: UnicodeDef;
    init() {
        self.data = UnicodeDef{};
    }
}