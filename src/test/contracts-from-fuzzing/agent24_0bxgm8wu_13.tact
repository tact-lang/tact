struct Point { x: Int; y: Int }

contract TestDestructuringCorrect {
    receive() {
        // Valid destructuring assignment with trailing comma support
        let Point { x, y, } = Point { x: 10, y: 20 };
        dump(x);
        dump(y);
    }
}
