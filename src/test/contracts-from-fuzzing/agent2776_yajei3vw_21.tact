struct DeeplyNested {
    a: Int;
    b: Int?;
    c: Int;
}

struct Container {
    inner: DeeplyNested;
}

struct Wrap {
    cont: Container;
}

contract TripleWrapTest {
    w: Wrap;

    init() {
        self.w = Wrap{ cont: Container{ inner: DeeplyNested{ a: 1, b: null, c: 2 } } };
    }
}
