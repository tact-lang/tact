struct Pair { first: Int; second: Int }

contract ReturnTestsValid {
    // Regular function 1: Early return
    fun earlyReturn(): Int {
        if (true) { return 42; }
        return 0;
    }

    // Regular function 2: Nested block return
    fun nestedReturn(): Int {
        {
            if (false) {
                return 1;
            }
        }
        return 2;
    }

    // Regular function 3: Loop with early return using repeat loop
    fun loopReturn(n: Int): Int {
        let i: Int = 0;
        repeat(n) {
            if (i == 2) { return i; }
            i += 1;
        }
        return -1;
    }

    // Regular function 4: Implicit semicolon after return
    fun implicitReturn(): Int {
        return 10
    }

    // Regular function 5: Unit return (void function)
    fun returnsUnit() {
        return;
    }

    // Regular function 7: Returning an optional Int
    fun returnsOptional(x: Bool): Int? {
        if (x) { return 1; } else { return null; }
    }

    // Regular function 8: Deep nested return
    fun deepReturn(): Int {
        let a: Int = 0;
        {
            if (a == 0) {
                {
                    if (true) { return 99; }
                }
            }
        }
        return 100;
    }

    // Getter 1: Simple getter returning Int
    get fun getValue(): Int {
        return 123;
    }

    // Getter 2: Conditional getter
    get fun conditionalGetter(): Int {
        let x: Int = 15;
        if (x > 10) { return 10; } else { return x; }
    }

    // Getter 3: Getter returning a structured tuple (Pair)
    get fun getPair(): Pair? {
        return Pair { first: 1, second: 2 };
    }

    // Getter 4: Getter with alternative path returning Pair
    get fun getPairAlternate(): Pair? {
        if (true) { return Pair { first: 3, second: 4 }; }
        return null;
    }
}

contract ReceiverTest1 {
    // Receiver 1: Simple receiver with early return (void context)
    receive() {
        if (true) { return; }
        dump(1);
    }
}

contract ReceiverTest2 {
    // Receiver 2: Receiver with nested block and loop-based early return
    receive() {
        {
            if (false) { return; }
        }
        repeat(5) {
            // Although the condition 1 == 1 is always true, we use it to test loop-embedded return
            if (1 == 1) { return; }
        }
        dump(2);
    }
}
