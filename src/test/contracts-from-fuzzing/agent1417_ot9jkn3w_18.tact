struct SInner {
    a: Int;
    b: Bool;
}

contract InitDefaults {
    x: Int = 5;
    y: Bool;
    z: SInner;

    init() {
        self.y = true;
        self.z = SInner{ a:1, b:false };
    }
}