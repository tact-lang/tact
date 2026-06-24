struct Point { x: Int; y: Int }

contract TestDestructuringValid {
    receive() {
        let p: Point = Point { x: 10, y: 20 };
        let Point { x: a, y: b } = p;
        dump(a + b);
    }
}
