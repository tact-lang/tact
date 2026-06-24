struct Inner {
    v: Int?;
}

struct Outer {
    inner: Inner?;
}

contract OptNested {
    o: Outer;

    init() {
        self.o = Outer{inner: null};
    }
}