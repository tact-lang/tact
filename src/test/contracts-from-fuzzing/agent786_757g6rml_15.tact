struct StrNest {
    s1: String;
    s2: String;
}

struct StrTop {
    nested: StrNest;
    s3: String;
}

contract ManyStrings {
    s: StrTop;

    init() {
        self.s = StrTop{
            nested: StrNest{ s1:"hi", s2:"bye" },
            s3: "hello"
        };
    }
}