struct Vector3 {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}

contract Fuzz15 {
    position: Vector3?;

    init() {
        self.position = null;
    }
}