struct Strings {
    s1: String;
    s2: String?;
}

contract StringsTest {
    data: Strings;

    init() {
        self.data = Strings{s1:"hello", s2:null};
    }
}