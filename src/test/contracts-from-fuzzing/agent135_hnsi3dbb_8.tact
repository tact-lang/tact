struct S {
    x: Int;
    y: Int?;
    z: Bool;
}

contract Test {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ x: 1, y: null, z: true };
        self.s2 = S{ x: 2, y: 5, z: false };
        self.s3 = S{ x: 3, y: null, z: true };
    }
}