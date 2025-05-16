struct Inner {
    score: Int;
}

struct Middle {
    innerOpt: Inner?;
}

struct Outer {
    middleOpt: Middle?;
}

contract ComplexOpt {
    data: Outer?;

    init() {
        self.data = Outer{
            middleOpt: Middle{
                innerOpt: Inner{ score: 999 },
            },
        };
    }

    receive() {}
}
