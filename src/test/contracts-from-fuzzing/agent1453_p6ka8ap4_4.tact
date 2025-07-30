struct InnerMost {
    x: Int;
}

contract TestContract {
    nested: InnerMost?;

    init() {
        self.nested = null;
    }
}