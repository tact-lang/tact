struct Variant {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Test13 {
    v: Variant?;

    init() {
        self.v = null;
    }
}