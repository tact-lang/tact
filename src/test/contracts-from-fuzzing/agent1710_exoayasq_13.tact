struct Deep {
    s1: String;
    s2: String?;
    num: Int;
}

struct Middle {
    deep: Deep;
    flag: Bool;
}

contract Test {
    m: Middle;
    another: Int;

    init() {
        self.m = Middle{
            deep: Deep{
                s1: "hi",
                s2: null,
                num: 42
            },
            flag: true
        };
        self.another = 99;
    }
}