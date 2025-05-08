struct OptionalOuter {
    s1: Inner?;
    s2: Inner?;
}

struct Inner {
    x: Int;
}

contract TestContract {
    o: OptionalOuter;
    init() {
        self.o = OptionalOuter{ s1: null, s2: Inner{ x: 5 } };
    }
}