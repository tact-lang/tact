struct Point { x: Int; y: Int }

contract TestDestructuring {
    receive() {
        // Testing destructuring assignment of a struct
        let Point { x, y } = Point { x: 10, y: 20 };
        dump(x + y); // expected output: 30
    }
}
