struct HasStrings {
    a: String;
    b: String;
}

contract HasStringsTest {
    data: HasStrings;

    init() {
        self.data = HasStrings{ a:"abc", b:"def" };
    }
}