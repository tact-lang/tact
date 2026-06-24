struct Point { x: Int; y: Int; }

contract TestDestructuring {
    init() {
        // Use destructuring assignment to unpack a Point struct
        let Point { x, y } = Point { x: 5, y: 10 };
        dump(x + y); // should dump 15
    }
}
