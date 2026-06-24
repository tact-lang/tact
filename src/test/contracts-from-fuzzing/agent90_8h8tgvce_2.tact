struct Nested {
    x: Int;
    y: Int?;
}

contract TestStorage {
    point: Nested = Nested{ x: 1, y: null };
    receive() {
        let z = self.point;
    }
}