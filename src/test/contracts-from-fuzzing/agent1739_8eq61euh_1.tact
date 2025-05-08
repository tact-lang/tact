struct SimpleNested {
    a: Int;
    b: Bool;
}

contract Test {
    data: SimpleNested;

    init() {
        self.data = SimpleNested{ a: 1, b: true };
    }
}
