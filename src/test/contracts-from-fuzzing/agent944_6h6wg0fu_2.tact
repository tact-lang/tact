struct Vector2 {
    dx: Int as int64;
    dy: Int as int64;
    dz: Int?;
}

contract NestedOptional {
    v: Vector2;

    init() {
        self.v = Vector2{ dx: 123, dy: 456, dz: null };
    }
}