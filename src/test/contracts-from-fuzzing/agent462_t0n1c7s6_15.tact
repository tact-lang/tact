struct InnerMost {
    flag: Bool;
    message: String;
}

struct Middle {
    count: Int;
    inner: InnerMost;
}

struct OuterMost {
    name: String;
    middle: Middle;
    active: Bool;
}

contract DeepManyNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            name: "outer",
            middle: Middle{
                count: 7,
                inner: InnerMost{
                    flag: false,
                    message: "deep"
                }
            },
            active: true
        };
    }
}