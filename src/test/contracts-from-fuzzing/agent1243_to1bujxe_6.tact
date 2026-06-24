struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    o: Outer;
    init() {
        self.o = Outer{ inner: null };
    }
}