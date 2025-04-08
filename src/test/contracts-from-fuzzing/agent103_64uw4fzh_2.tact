struct S {
    x: Int;
    y: Bool?;
    z: String?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{ x: 2, y: null, z: null };
    }
}
