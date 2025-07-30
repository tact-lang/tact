struct S {
    x: Int;
    y: Int?;
    z: Bool;
}

contract Test {
    data: S;

    init() {
        self.data = S{ x: 5, y: null, z: true };
    }
}
