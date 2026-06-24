struct Inner {
    a: Int? = null;
    b: Bool? = null;
}

struct Outer {
    innerOpt: Inner? = null;
    x: Int;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer {
            x: 42
        };
    }
}