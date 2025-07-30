struct Pair { x: Int; y: Int }

contract TestDestructuring {
    receive() {
        // Test destructuring assignment with field punning and trailing commas
        let Pair { x, y, } = Pair { x: 1, y: 2, };
        dump(x + y);
    }
}
