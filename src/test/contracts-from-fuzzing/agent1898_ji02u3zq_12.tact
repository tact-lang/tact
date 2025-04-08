struct V { x: Int; y: Int; }

contract FieldReorder {
    p: V;
    a: Int;

    init() {
        self.p = V{ x: 1, y: 2 };
        self.a = 10;
    }
}