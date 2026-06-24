struct InnerMost {
    foo: Int;
}

struct Middle {
    nested: InnerMost?;
}

contract TestContract {
    deep: Middle?;

    init() {
        self.deep = Middle{ nested: null };
    }

    receive() {
        self.deep;
    }
}