struct Point { x: Int; y: Int }

contract TestContract {
    receive() {
        // Destructuring assignment statement test
        let Point { x, y } = Point { x: 7, y: 8 };
        dump(x);
        dump(y);
    }
}
