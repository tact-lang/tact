struct InnerMost {
    p: Int?;
    q: Bool?;
}

struct Middle {
    im: InnerMost?;
    flag: Bool;
}

struct OuterMost {
    mid: Middle?;
    value: Int;
}

contract DeepOptionals {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid: Middle{
                im: InnerMost{
                    p: null,
                    q: true
                },
                flag: false
            },
            value: 321
        };
    }
}