struct DeepNested {
    inner: Inner;
    z: Bool = false;
}

struct Inner {
    a: Int = 1;
    b: Bool = true;
    s: String = "hi";
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: Inner{},
            z: false,
        };
    }
}
