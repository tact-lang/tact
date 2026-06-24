struct Deep {
    s1: String;
    optInt: Int?;
}

struct Outer {
    s2: String;
    sub: Deep;
    optSub: Deep?;
    flag: Bool;
}

contract OptionalOps {
    data: Outer?;

    init() {
        self.data = Outer{
            s2: "outer",
            sub: Deep{ s1: "deep", optInt: null },
            optSub: null,
            flag: false
        };
    }
}