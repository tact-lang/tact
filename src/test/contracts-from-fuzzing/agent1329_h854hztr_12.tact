struct S {
    x: Int as uint32;
    y: Int as int64;
    z: Int as int257;
}

contract SerializeVariants {
    s: S;

    init() {
        self.s = S{ x:1, y:-123, z:999 };
    }
}
