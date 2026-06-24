struct Point {
    x: Int;
    y: Int;
}

contract Test(
    p: Point,
) {
    receive() {
        // Use the struct field
        let _ = self.p.x + self.p.y;
    }
}
