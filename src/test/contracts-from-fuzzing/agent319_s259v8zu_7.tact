struct InlineOpt {
    a: Int?;
    b: Bool;
    c: Int;
}

contract TestContract {
    x: InlineOpt?;

    init() {
        self.x = null;
    }
}