struct MultiStr {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract TestStrs {
    rec: MultiStr;

    init() {
        self.rec = MultiStr{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four"
        };
    }
}