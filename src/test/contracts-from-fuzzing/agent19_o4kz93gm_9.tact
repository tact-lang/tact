struct Point { x: Int; y: Int }

contract TestDestructuring {
    receive() {
         let p: Point = Point { x: 10, y: 20 };
         let Point { x, y } = p;
         dump(x + y);
    }
}
