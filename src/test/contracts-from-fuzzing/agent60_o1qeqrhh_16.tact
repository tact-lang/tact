struct Point {
    x: Int;
    y: Int;
}

contract TestFieldAccess {
    fun getPoint(): Point {
        return Point { x: 10, y: 20 };
    }

    receive() {
        let p = self.getPoint();
        let sum: Int = p.x + p.y;  // Expect 30
        dump(sum);
    }
}
