struct NestedOrdering {
    x: Int as int1;
    y: Bool;
    z: String;
}

contract NestedOrderingTest {
    s: NestedOrdering;

    init() {
        self.s = NestedOrdering{
            x: -1,
            y: false,
            z: "nested",
        };
    }
}