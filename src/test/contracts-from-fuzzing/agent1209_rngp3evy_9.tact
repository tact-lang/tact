struct Inner {
    flag: Bool;
    val: Int;
}

struct Mid {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
}

contract MultiNested {
    data: Outer;
    init() {
        self.data = Outer{
            mid1: Mid{
                inner1: Inner{flag: true, val: 1},
                inner2: Inner{flag: false, val: 2}
            },
            mid2: Mid{
                inner1: Inner{flag: false, val: 3},
                inner2: Inner{flag: true, val: 4}
            }
        };
    }
}