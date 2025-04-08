struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    inn: InnerMost;
    flag: Bool;
}

struct Top {
    mid: Middle;
}

contract NestedStructs {
    t: Top;

    init() {
        self.t = Top{
            mid: Middle{
                inn: InnerMost{
                    a: 10,
                    b: "hello"
                },
                flag: true
            }
        };
    }
}