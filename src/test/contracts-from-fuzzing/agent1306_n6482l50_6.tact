struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    innerMost: InnerMost;
    flag: Bool;
}

contract TestContract {
    middle: Middle;

    init() {
        self.middle = Middle{
            innerMost: InnerMost{
                x: -5,
                y: false,
            },
            flag: true,
        };
    }
}