struct Embedded {
    x: Int;
    y: Bool;
    z: String?;
}

contract Test {
    e: Embedded;

    init() {
        self.e = Embedded{ x: 1, y: false, z: null };
    }
}