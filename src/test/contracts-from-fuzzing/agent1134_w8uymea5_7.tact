struct Inner {
    i: Int;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    middleA: Middle;
    middleB: Middle;
}

contract Nesting {
    data: Outer;

    init() {
        self.data = Outer{
            middleA: Middle{
                inner1: Inner{i: 1},
                inner2: Inner{i: 2}
            },
            middleB: Middle{
                inner1: Inner{i: 3},
                inner2: Inner{i: 4}
            }
        };
    }
}