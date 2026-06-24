struct EdgeCaseVariant {
    i: Int? = null;
    s: String? = null;
    b: Bool? = null;
}

contract TestContract {
    e: EdgeCaseVariant;

    init() {
        self.e = EdgeCaseVariant{};
    }
}