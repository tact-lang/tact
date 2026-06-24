struct SDefault {
    x: Int = 5;
    y: String = "hi";
    z: Bool?;  // implicit default null
}

contract DefaultStructs {
    s: SDefault;
    init() {
        self.s = SDefault{};
    }
}
