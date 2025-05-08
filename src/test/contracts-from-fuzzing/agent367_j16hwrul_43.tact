// struct defaults with empty string
struct WithEmptyStr {
    s: String = "";
    a: Int = 0;
    b: Bool = false;
}

contract EmptyStrDefaultsTest {
    stuff: WithEmptyStr;
    init() {
        self.stuff = WithEmptyStr{};
    }
}