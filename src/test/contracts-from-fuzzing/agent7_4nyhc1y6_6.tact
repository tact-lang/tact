struct Example { number: Int }

contract TestDestructuring {
    receive() {
        // Valid destructuring assignment
        let Example { number } = Example { number: 42 };
        dump(number);
    }
}
