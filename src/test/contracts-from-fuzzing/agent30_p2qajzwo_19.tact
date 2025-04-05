struct Pair {
    a: Int;
    b: Int;
}

contract TestDestructuringAssignment {
    receive() {
        // Destructuring assignment: unpack a struct into variables
        let Pair { a, b } = Pair { a: 10, b: 20 };
        let sum: Int = a + b; // 30
        sum;
    }
}
