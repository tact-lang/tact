struct DeepNested {
    inner: Inner;
}

struct Inner {
    sub: SubInner;
}

struct SubInner {
    val: Int;
}

contract TestNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{ inner: Inner{ sub: SubInner{ val: 5 } } };
    }
}