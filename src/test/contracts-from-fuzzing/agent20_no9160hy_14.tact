struct Point { x: Int; y: Int }

contract TestDestructure {
    fun getPoint(): Point {
         return Point { x: 10, y: 20 };
    }

    receive() {
        let Point { x, y } = self.getPoint();
        dump(x + y);
    }
}
