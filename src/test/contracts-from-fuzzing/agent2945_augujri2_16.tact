struct Inner {
    flag: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract RepeatNested {
    o: Outer;

    init() {
        self.o = Outer{
            inner1: Inner{flag: true},
            inner2: Inner{flag: false},
            inner3: Inner{flag: true}
        };
    }
}