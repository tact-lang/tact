struct S {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract NestedMultiOpts {
    s1: S?;
    s2: S?;

    init() {
        self.s1 = null;
        self.s2 = S{ x: 1, y: null, z: null };
    }
}