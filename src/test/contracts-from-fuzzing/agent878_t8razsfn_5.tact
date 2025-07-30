struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner?;
    other: Int?;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer{ nested: null, other: null };
    }
}