contract NestedInitConsts {
    x: Int = 1;
    y: String = "abc";
    z: Bool = false;

    init() {
        self.x = 42;
        self.y = "changed";
        self.z = true;
    }
}