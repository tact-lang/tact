struct NestedInits {
    inner1: Int = 1;
    inner2: Bool = true;
    inner3: String? = null;
}

contract StructWithDefaultsInField {
    s: NestedInits;

    init() {
        self.s = NestedInits{};
    }
}