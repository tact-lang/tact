contract Defaults {
    x: Int;
    y: Int = 42;
    z: Bool;

    init() {
        self.x = 1;
        self.z = true;
    }
}