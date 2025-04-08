struct Inner {
    f: Bool?;
}

struct Outer {
    inner: Inner;
    number: Int?;
}

contract NestedOption {
    o: Outer;

    init() {
        self.o = Outer{inner: Inner{f: null}, number: null};
    }
}