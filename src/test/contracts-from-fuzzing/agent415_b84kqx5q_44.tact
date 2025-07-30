struct NS {
    a: Int;
    b: Int?;
}

contract NestedNullable {
    x: NS?;

    init() {
        self.x = null;
    }
}