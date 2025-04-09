struct InnerMost {
    num: Int;
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    text: String;
}

struct OuterMost {
    mid: Middle;
    opt: Int?;
}

contract DeepMix {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid: Middle{
                inner: InnerMost{ num: 99, flag: false },
                text: "hi"
            },
            opt: 77
        };
    }
}
