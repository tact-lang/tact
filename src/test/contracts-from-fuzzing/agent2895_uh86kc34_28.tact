struct S1 { a: Int }
struct S2 { b: Int }
struct Both {
    s1: S1;
    s2: S2;
}

contract OptionalNestedBoth {
    o: Both?;

    init() {
        self.o = null;
    }
}
