struct Middle {
    num: Int = 4;
}

struct Outer {
    middle: Middle;
    optNumber: Int?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                num: 42
            },
            optNumber: null
        };
    }

    receive() {
        self.outer.middle.num = 0;
    }
}