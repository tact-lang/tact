struct S {
    a: Int;
}

contract MultipleVars {
    x: S;
    y: S;
    z: S;

    init() {
        self.x = S{a:1};
        self.y = S{a:2};
        self.z = S{a:3};
    }
}