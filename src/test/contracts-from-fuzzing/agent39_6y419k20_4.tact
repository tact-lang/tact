struct Point { x: Int; y: Int }

contract TestDestructuring {
    init() {}
    receive() {
        // Destructuring assignment: unpacking Point struct into x and y
        let Point { x, y } = Point { x: 10, y: 32 };
        dump(x);  // expected to output 10
        dump(y);  // expected to output 32
    }
}
