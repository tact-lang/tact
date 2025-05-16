struct Pair { x: Int?; y: Int? }

// Function that uses a non-null assertion to unwrap the optional value
fun optCase(x: Int?): Int {
    if (x == null) {
        return 0;
    }
    return x!!; // using non-null assertion operator to unwrap
}

fun sideEffectTrue(): Bool {
    dump(101);
    return true;
}

fun sideEffectFalse(): Bool {
    dump(202);
    return false;
}

// Test optional comparisons
contract TestOptComp {
    receive() {
        let a: Int? = null;
        dump(a == null);  // expected: true
        let b: Int? = 10;
        dump(b != null);  // expected: true
    }
}

// Test destructuring of optionals
contract TestOptDestruct {
    receive() {
        let Pair { x, y } = Pair { x: null, y: 20 };
        dump(x == null); // expected: true
        dump(y == 20);   // expected: true
    }
}

// Test function with optional parameter
contract TestOptFunc {
    receive() {
        dump(optCase(null));  // expected: 0
        dump(optCase(42));    // expected: 42
    }
}

// Test short-circuit evaluation in logical operators
contract TestShortCircuit {
    receive() {
        // In short-circuit OR, sideEffectFalse() should not be called if sideEffectTrue() returns true
        dump(sideEffectTrue() || sideEffectFalse());
        // In short-circuit AND, sideEffectTrue() should not be called if sideEffectFalse() returns false
        dump(sideEffectFalse() && sideEffectTrue());
    }
}

// Test combined logical chain
contract TestLogicalChain {
    receive() {
        dump((false || true) && (true || false)); // expected: true
    }
}
