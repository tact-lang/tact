struct Reordered {
    x: Int as uint32;
    y: Int;
    z: Bool;
}

contract SerializationOrderTest {
    example: Reordered;

    init() {
        self.example = Reordered{ x: 5, y: 6, z: true };
    }
}