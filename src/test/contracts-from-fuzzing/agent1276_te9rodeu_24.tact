struct S {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract AllNullables {
    s: S?;

    init() {
        self.s = null;
    }
}