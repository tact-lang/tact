struct NestedInner {
    x: Int = 303;
    y: Bool = false;
}

contract NestedContainer {
    data: NestedInner;

    init() {
        self.data = NestedInner{};
    }
}