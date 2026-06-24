struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptTest {
    data: NestedOptionals?;

    init() {
        self.data = NestedOptionals{
            x: null,
            y: true,
            z: null,
        };
    }

    receive() {}
}