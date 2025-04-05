struct Point { x: Int; y: Int; }

contract TestStruct {
    fun test() {
        // Instantiate a struct Point
        let p: Point = Point{ x: 10, y: 20 };
        let cell = p.toCell();
        let p2: Point = Point.fromCell(cell);
        // Verify that the fields are correctly serialized/deserialized
        dump(p2.x == 10);
        dump(p2.y == 20);
    }

    receive() {
        self.test();
    }
}
