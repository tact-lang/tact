struct Nested {
    x: Int;
    y: Int?;
}

contract TestStorage {
    point: Nested? = null;

    receive() {
        let z = self.point;
    }
}