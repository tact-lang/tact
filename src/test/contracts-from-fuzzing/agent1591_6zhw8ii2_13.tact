struct Inner {
    p: Int;
}

struct S {
    i1: Inner;
    i2: Inner;
    i3: Inner;
    i4: Inner;
    i5: Inner;
}

contract ManyStructRefs {
    s: S;

    init() {
        self.s = S{
            i1: Inner{p:1},
            i2: Inner{p:2},
            i3: Inner{p:3},
            i4: Inner{p:4},
            i5: Inner{p:5},
        };
    }

    receive() {
        self.s = self.s;
    }
}