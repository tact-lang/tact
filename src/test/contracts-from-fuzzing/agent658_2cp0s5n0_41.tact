struct Inner {
    a: Int;
}

struct Outer {
    one: Inner;
    two: Inner;
}

contract SameStructTwice {
    o: Outer;

    init() {
        self.o = Outer{
            one: Inner{a:1},
            two: Inner{a:2}
        };
    }
}