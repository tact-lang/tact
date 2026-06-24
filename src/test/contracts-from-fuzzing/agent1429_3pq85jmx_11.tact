struct Strings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringTest {
    strStruct: Strings;

    init() {
        self.strStruct = Strings{
            s1: "abc",
            s2: null,
            s3: "def",
            s4: "ghi"
        };
    }
}