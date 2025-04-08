struct S {
    x: Int as int64;
    y: Int as uint4;
    z: Bool;
}

contract Test {
    data: S;

    init() {
        self.data = S{ x: 100, y: 9, z: false };
    }
}
