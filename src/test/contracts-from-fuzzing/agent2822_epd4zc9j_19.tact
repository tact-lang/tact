struct Strs {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFields {
    s: Strs;
    init() {
        self.s = Strs { s1: "a", s2: "b", s3: "c" };
    }
}