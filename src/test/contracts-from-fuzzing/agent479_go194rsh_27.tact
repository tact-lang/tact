struct S {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract MultiDefaults {
    x: S? = null;
    y: S? = null;
    z: S? = null;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}