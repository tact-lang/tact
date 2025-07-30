struct ManyStr {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LargeStringStruct {
    val: ManyStr;

    init() {
        self.val = ManyStr{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d"
        };
    }
}