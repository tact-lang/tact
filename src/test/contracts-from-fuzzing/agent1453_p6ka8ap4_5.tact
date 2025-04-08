struct InnerMost {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: InnerMost?;

    init() {
        self.nested = InnerMost{ x: 99, y: false };
    }
}