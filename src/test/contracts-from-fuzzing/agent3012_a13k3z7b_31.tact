// Boolean edges with optional defaulted
contract BoolsEdge {
    a: Bool = false;
    b: Bool? = null;

    init() {
        self.a = true;
        self.b = null;
    }
}