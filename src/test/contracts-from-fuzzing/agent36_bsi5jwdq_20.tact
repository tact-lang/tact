struct Example { number: Int }

contract TestDestructuring {
    receive() {
        // Destructuring assignment from an instantiation
        let Example { number } = Example { number: 42 };
        dump(number); // expected output: 42
    }
}
