struct InnerMost {
    x: Int;
}

struct Middle {
    innermost: InnerMost;
    y: String;
}

struct Outer {
    middle: Middle;
    flag: Bool;
    optionalStr: String?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                innermost: InnerMost{
                    x: 777
                },
                y: "middle layer"
            },
            flag: false,
            optionalStr: null
        };
    }

    receive() {}
}