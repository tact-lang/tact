struct Nested {
    x: Int;
    y: Int?;
}

contract TestStorage(point: Nested) {
    receive() {
        let z = self.point;
    }
}