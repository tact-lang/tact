struct Deep {
    a: Int;
    b: Int?;
    c: String;
}

struct OuterMost {
    f1: Int;
    nested: Deep;
    optNested: Deep?;
    text: String;
}

contract DeepNest {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            f1: 10,
            nested: Deep{ a: 1, b: null, c: "hi" },
            optNested: null,
            text: "yo"
        };
    }
}