struct ManyStr {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
    s5: String;
}

contract LotsOfStrings {
    data: ManyStr;
    init() {
        self.data = ManyStr{
            s1:"a",
            s2:null,
            s3:"b",
            s4:null,
            s5:"c"
        };
    }
}