struct InnerMost {
    foo: Int? = null;
}

struct Middle {
    im: InnerMost? = null;
}

struct Outer {
    m: Middle? = null;
}

contract TestContract {
    o: Outer? = null;

    init() {
        self.o = null;
    }
}