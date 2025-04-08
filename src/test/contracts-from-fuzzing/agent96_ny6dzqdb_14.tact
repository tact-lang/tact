struct Inner {
    a: Int;
}

struct Outer {
    nest1: Inner;
    nest2: Inner;
    nest3: Inner;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            nest1: Inner{a: 1},
            nest2: Inner{a: 2},
            nest3: Inner{a: 3},
        };
    }
}