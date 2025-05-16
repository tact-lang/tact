struct StrTest {
    str1: String;
    str2: String?;
}

contract StringFields {
    ss: StrTest = StrTest{
        str1: "abc",
        str2: null
    };

    init() {
        self.ss = StrTest{
            str1: "def",
            str2: "ghi"
        };
    }
}