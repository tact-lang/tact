struct Example {
    value: Int;
}

contract TestDestructuring {
    receive() {
        // Destructuring assignment
        let Example { value } = Example { value: 100 };
        let doubled: Int = value * 2; // test usage of the destructured variable
    }
}
