struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalContainer {
    container: NestedOptionals?;

    init() {
        self.container = NestedOptionals{
            x: 10,
            y: false,
            z: "hey"
        };
    }
}