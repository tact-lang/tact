struct StrVals {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StringHeavy {
    data: StrVals;

    init() {
        self.data = StrVals{
            s1: "aaa",
            s2: "bbb",
            s3: "ccc",
            s4: "ddd",
        };
    }

    receive() {}
}