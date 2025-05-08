struct Edge {
    x: Int;
    y: Bool?;
}

contract OptionalAtEdge {
    val: Edge;
    init() {
        self.val = Edge{ x: 10, y: null };
    }
}