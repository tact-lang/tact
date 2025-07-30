contract PartialDefault {
    x: Int;       // no default
    y: Int = 5;  // has default
    z: Int?;     // optional, defaults to null implicitly

    init() {
        self.x = 10;
    }
}