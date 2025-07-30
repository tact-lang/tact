contract OnlyPrimitives {
    x: Int;
    y: String;
    z: Bool;

    init() {
        self.x = 777;
        self.y = "primitive";
        self.z = true;
    }
}