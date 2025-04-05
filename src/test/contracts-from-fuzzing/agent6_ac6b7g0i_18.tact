struct Point { x: Int; y: Int; }

contract TestDestructuringRenamed {
    receive() {
        // Destructuring a struct with renaming fields
        let p: Point = Point { x: 10, y: 20 };
        let Point { x: a, y: b } = p;
        // Expected output: 30
        dump(a + b);
    }
}

contract TestTryCatchBasic {
    receive() {
        // Basic try-catch to catch an explicit throw
        try {
            throw(123);
        } catch (e) {
            // Expected to catch and dump the exit code 123
            dump(e);
        }
    }
}

contract TestBitwiseNegative {
    receive() {
        // Testing bitwise NOT on a negative number
        let x: Int = -1;
        // ~(-1) should invert all bits yielding 0
        let y: Int = ~x;
        dump(y);
    }
}
