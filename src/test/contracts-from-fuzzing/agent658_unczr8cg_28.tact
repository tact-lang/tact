struct Wrapped {
    s: Inner;
}

struct Inner {
    n: Int;
}

contract WrappedStruct {
    f: Wrapped;

    init() {
        self.f = Wrapped{
            s: Inner{n:1}
        };
    }
}