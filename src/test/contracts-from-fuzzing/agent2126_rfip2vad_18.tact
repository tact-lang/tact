struct InnerMost {
    id: Int;
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    label: String;
}

struct Outer {
    middle: Middle;
    optionalMiddle: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{
                    id: 1,
                    flag: true,
                },
                label: "L",
            },
            optionalMiddle: null,
        };
    }
}
