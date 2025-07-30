contract TestContractParam(val: Int) {
    receive() {
        dump(self.val); // Expected: the deployment-provided value
    }
}

contract TestPersistentState {
    counter: Int = 0;

    init() {
        // Augmented assignment: counter should become 42
        self.counter += 42;
    }

    receive() {
        dump(self.counter); // Expected output: 42
    }
}

struct Data {
    a: Int;
    b: Int;
}

contract TestDestructuringComma {
    receive() {
        let Data { a, b, } = Data { a: 20, b: 22 };
        dump(a + b); // Expected output: 42
    }
}

fun increment(x: Int): Int {
    return x + 1;
}

contract TestChaining {
    receive() {
        dump(increment(increment(40))); // Expected output: 42
        dump(42.toString());           // Expected output: "42"
    }
}

contract TestForeachEmpty {
    receive() {
        let m: map<Int, Int> = emptyMap();
        let sum: Int = 0;
        foreach (k, v in m) {
            sum += v;
        }
        dump(sum); // Expected output: 0
    }
}

contract TestNonNullPositive {
    receive() {
        let opt: Int? = 42;
        dump(opt!!); // Expected output: 42
    }
}

contract TestTernaryPrecise {
    receive() {
        let result: Int = false ? (false ? 1 : 2) : 3; // Nested ternary with parentheses
        dump(result); // Expected output: 3
    }
}
