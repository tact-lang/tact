struct Inner {
    foo: Int? = null;
}

struct Outer {
    inr: Inner?;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{ inr: null };
    }
}