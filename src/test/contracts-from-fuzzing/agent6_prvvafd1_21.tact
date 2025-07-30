struct Point { x: Int; y: Int; z: Int; }

contract TestDestructuring {
    receive() {
         let p: Point = Point{ x: 1, y: 2, z: 3 };
         let Point { x: newX, .. } = p;
         require(newX == 1, "Destructuring failed");
         cashback(sender());
    }
}
