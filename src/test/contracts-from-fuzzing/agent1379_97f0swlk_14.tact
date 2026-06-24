struct StrTest {
    s1: String;
    s2: String?;
}

contract StringsMostly {
    a: StrTest;

    init() {
        self.a = StrTest{
            s1: "constant",
            s2: null
        };
    }
}
