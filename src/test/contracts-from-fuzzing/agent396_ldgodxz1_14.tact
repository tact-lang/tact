struct Point { x: Int; y: Int; }

contract StructDefault {
    p: Point = Point { x:1, y:2 };

    receive() { return; }
}