struct Deep {
    s1: String?;
    s2: String?;
    flag: Bool;
    num: Int;
}

struct Middle {
    id: Int;
    deep: Deep;
    comment: String;
}

contract Complex {
    m1: Middle;
    m2: Middle;

    init() {
        self.m1 = Middle{
            id: 1,
            deep: Deep{
                s1: null,
                s2: "hello",
                flag: true,
                num: 100
            },
            comment: "first"
        };

        self.m2 = Middle{
            id: 2,
            deep: Deep{
                s1: "world",
                s2: null,
                flag: false,
                num: 200
            },
            comment: "second"
        };
    }
}