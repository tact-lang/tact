struct OptionalEdge {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalEdgeCaseTest {
    x: OptionalEdge?;

    init() {
        self.x = null;
    }
}