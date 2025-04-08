struct InnerMost {
    flag: Bool;
    note: String;
}

struct Middle {
    num: Int;
    optInner: InnerMost?;
}

struct OuterMost {
    mainText: String;
    maybeMid: Middle?;
}

contract DeepOptionalNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mainText: "start",
            maybeMid: Middle{
                num: 999,
                optInner: InnerMost{
                    flag: true,
                    note: "deepest"
                }
            }
        };
    }
}