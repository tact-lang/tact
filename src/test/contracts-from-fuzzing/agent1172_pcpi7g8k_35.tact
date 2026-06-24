struct NestedStr {
    s1: String;
    inner: InnerStr;
}

struct InnerStr {
    s2: String;
    s3: String;
}

contract StringNest {
    hold: NestedStr;

    init() {
        self.hold = NestedStr{
            s1: "x",
            inner: InnerStr{ s2: "y", s3: "z" }
        };
    }
}