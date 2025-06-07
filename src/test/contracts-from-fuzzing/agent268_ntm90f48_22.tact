struct OptNested {
    s1: S1?;
}

struct S1 {
    s2: S2?;
}

struct S2 {
    x: Int;
}

contract DeepOptChain {
    o: OptNested;
    init() {
        self.o = OptNested{ s1: null };
    }
}