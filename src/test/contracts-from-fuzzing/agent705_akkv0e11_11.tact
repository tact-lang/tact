struct StringLayer {
    s1: String;
    s2: String;
    s3: String;
}

struct OuterLayer {
    inner: StringLayer;
    optStr: String?;
}

contract StringStructs {
    val: OuterLayer;

    init() {
        self.val = OuterLayer {
            inner: StringLayer { s1:"x", s2:"y", s3:"z" },
            optStr: null
        };
    }
}