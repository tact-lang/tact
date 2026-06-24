struct OptionalLeaf {
    x: Int?;
    y: String?;
}

contract OptStructTest {
    prop: OptionalLeaf;

    init() {
        self.prop = OptionalLeaf{ x: null, y: null };
    }
}