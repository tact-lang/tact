struct OptNested {
    inner: Inner?;
}

struct Inner {
    n: Int;
}

contract Test {
    o: OptNested;

    init() {
        self.o = OptNested{
            inner: null
        };
    }
}