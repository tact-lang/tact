struct OptNested {
    x: Int?;
    y: Bool?;
    z: Cell?;
}

contract TestOptional {
    data: OptNested;

    init() {
        self.data = OptNested{
            x: null,
            y: true,
            z: null
        };
    }
}