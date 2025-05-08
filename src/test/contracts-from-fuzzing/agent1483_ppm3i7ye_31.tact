struct DefaultsEdgeCase {
    a: Int = 1;
    b: Bool? = null;
    c: String = "def";
    d: Address? = null;
}

contract DefaultsEdge {
    s: DefaultsEdgeCase;

    init() {
        self.s = DefaultsEdgeCase{};
    }
}