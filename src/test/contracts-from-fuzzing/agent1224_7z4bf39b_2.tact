struct NestedS {
    x: Int;
    y: Bool;
}

contract B {
    data: NestedS;

    init() {
        self.data = NestedS{x: 42, y: false};
    }
}