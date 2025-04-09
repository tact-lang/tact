struct Inner {
    s: String? = null;
}

struct Outer {
    i: Inner;
}

contract ImplicitNull {
    o: Outer;

    init() {
        self.o = Outer{ i: Inner{} };
    }
}
