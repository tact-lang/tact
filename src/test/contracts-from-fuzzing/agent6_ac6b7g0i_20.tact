contract TestAugmentedAssignment {
    receive() {
        let x: Int = 10;
        x += 5;
        x -= 3;
        x *= 2;
        x /= 4;
        // Expected: ((10 + 5) - 3) * 2 / 4 = (15 - 3) * 2 / 4 = 12 * 2 / 4 = 24 / 4 = 6
        dump(x);
    }
}

struct Pair { a: Int; b: Int; }

contract TestDestructuringDiscard {
    receive() {
        let p: Pair = Pair { a: 100, b: 200 };
        let Pair { a, b: _ } = p;
        // Expected to dump 100
        dump(a);
    }
}

contract TestOptionalNullSafety {
    receive() {
        let opt: Int? = null;
        if (opt != null) {
            dump(opt!!);
        } else {
            dump(0);
        }
    }
}

contract TestTryNoCatch {
    receive() {
        // Try block without a catch block: the thrown exit code should propagate
        try {
            throw(55);
        }
        // If no catch is provided, execution should stop and not reach the dump below
        dump(1);
    }
}
