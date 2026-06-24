struct ContainsOptional {
    flag: Bool?;
}

contract OptMiddlePosition {
    x: Int = 1;
    y: ContainsOptional? = null;
    z: Int = 3;

    init() {
        self.y = null;
    }
}