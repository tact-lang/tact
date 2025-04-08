struct Nested {
    x: Int;
    y: Int?;
}

contract TestStorage {
    point: Nested;

    init() {
        self.point = Nested{ x: 5, y: null };
    }

    receive() {
        let z = self.point;
    }
}