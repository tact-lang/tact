contract SparseDefaults {
    x: Int;
    y: Int = 5;
    z: Int;
    a: Int = 7;
    b: Int;

    init() {
        self.x = 1;
        self.z = 3;
        self.b = 9;
    }
}