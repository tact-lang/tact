struct Point { x: Int; y: Int; }

contract TestStructs() {
    fun test() {
         let p: Point = Point{ x: 10, y: 20 };
         let cell: Cell = p.toCell();
         let p2: Point = Point.fromCell(cell);
         dump(p2.x); // expected output: 10
         dump(p2.y); // expected output: 20
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
