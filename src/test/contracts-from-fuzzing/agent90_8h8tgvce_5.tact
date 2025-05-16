struct Nested {
    x: Int;
    y: Int?;
}

contract TestStorage {
    point: Nested?;

    init() {
        self.point = null;
    }

    receive() {
        let z = self.point;
    }
}