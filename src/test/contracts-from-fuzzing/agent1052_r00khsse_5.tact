struct Inner {
    a: Int;
}

struct Mid {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
}

contract MultiNest {
    data: Outer;

    init() {
        self.data = Outer{
            mid1: Mid{inner1: Inner{a:1}, inner2: Inner{a:2}},
            mid2: Mid{inner1: Inner{a:3}, inner2: Inner{a:4}}
        };
    }
}