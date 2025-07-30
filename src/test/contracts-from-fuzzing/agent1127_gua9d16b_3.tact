struct StrTest {
    s1: String;
    s2: String;
    opt: String?;
}

contract ManyStrings {
    rec: StrTest;

    init() {
        self.rec = StrTest{
            s1: "Hello",
            s2: "World",
            opt: null
        };
    }
}