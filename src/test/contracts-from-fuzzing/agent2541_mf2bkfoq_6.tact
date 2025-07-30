struct OptNested {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    x: Int?;
    y: Bool?;
    nested: OptNested?;

    init() {
        self.x = null;
        self.y = null;
        self.nested = null;
    }
}