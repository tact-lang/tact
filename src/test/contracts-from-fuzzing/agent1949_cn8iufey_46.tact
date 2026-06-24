struct ManyStrings {
    a: String;
    b: String?;
    c: String?;
    d: String;
}

contract StringsTest {
    f: ManyStrings;

    init() {
        self.f = ManyStrings{a:"aa",b:null,c:null,d:"dd"};
    }
}
