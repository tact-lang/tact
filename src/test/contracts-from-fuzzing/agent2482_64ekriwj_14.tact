struct NestedOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
    z: Int;
}

contract Test {
    data: NestedOptionals?;

    init() {
        self.data = null;
    }
}