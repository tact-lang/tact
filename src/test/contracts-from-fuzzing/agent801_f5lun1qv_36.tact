struct OptInt {
    x: Int?;
    y: Int?;
}

contract NoDefaults {
    vals: OptInt;

    init() {
        self.vals = OptInt{
            x: null,
            y: 42
        };
    }
}