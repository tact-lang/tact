struct MultiStr {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiStringer {
    val: MultiStr;

    init() {
        self.val = MultiStr{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}