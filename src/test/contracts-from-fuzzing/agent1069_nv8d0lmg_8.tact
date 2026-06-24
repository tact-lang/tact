struct Strings {
    s1: String;
    s2: String?;
}

contract StringStructTest {
    content: Strings;

    init() {
        self.content = Strings{s1: "hello", s2: null};
    }
}