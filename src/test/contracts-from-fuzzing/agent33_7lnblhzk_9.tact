struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: Inner{
                i: 99
            }
        };
    }

    receive() {}

    get fun getNested(): Outer {
        return self.outer;
    }
}
