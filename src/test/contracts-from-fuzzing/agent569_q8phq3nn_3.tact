struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    i1: Inner;
    i2: Inner;
    flag: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            i1: Inner{a: 1, b: true},
            i2: Inner{a: 2, b: false},
            flag: true,
        };
    }
}