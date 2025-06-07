struct Sub {
    x: Int;
    y: Bool?;
    z: String?;
}

contract NestedOption {
    s: Sub?;

    init() {
        self.s = null;
    }
}
