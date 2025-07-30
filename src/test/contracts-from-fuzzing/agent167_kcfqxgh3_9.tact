struct S {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

contract StructRewrite {
    s: S;

    init() {
        self.s = S{x:5, y:6, z:7};
        self.s = S{x:8, y:9, z:10};
    }
}