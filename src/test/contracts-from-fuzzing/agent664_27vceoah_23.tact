struct WithStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringsStructTest {
    s: WithStrings;

    init() {
        self.s = WithStrings{ a:"a", b:null, c:"c", d:null };
    }
}
