struct DefaultEdge {
    a: Int = -1;
    b: Int = 0;
    c: Int = 1;
}

contract EdgeDefaultsTest {
    val: DefaultEdge;

    init() {
        self.val = DefaultEdge{};
    }
}