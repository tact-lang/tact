struct InnerMost {
    val: Int;
}

struct Inner {
    m: InnerMost?;
}

struct Outer {
    inner: Inner;
}

contract DeepNested {
    o: Outer;

    init() {
        self.o = Outer{ inner: Inner{ m: InnerMost{ val: 11 } } };
    }
}