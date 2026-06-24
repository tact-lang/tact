struct Child {
    x: Int;
    y: String;
    z: Bool;
}

contract WithDefaults {
    data: Child = Child{ x: 1, y: "a", z: true };

    init() {
        self.data = Child{
            x: 42,
            y: "hello",
            z: false
        };
    }
}