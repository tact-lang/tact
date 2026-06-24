struct S {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptAll {
    data: S;

    init() {
        self.data = S{ x: null, y: null, z: null };
    }
}