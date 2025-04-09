struct Tuple2 { first: Int; second: Int }

message Message { isEmpty: Bool }

contract TestReturns {
    // 1. Standard function with immediate return
    fun standardReturn(a: Int): Int {
        return a + 1;
    }

    // 2. Early return inside conditional
    fun conditionalReturn(a: Int): Int {
        if (a > 10) {
            return a; // early exit
        }
        return a * 2;
    }

    // 3. Return inside nested block
    fun nestedBlockReturn(): Int {
        {
            let r = 42;
            return r;
        }
        // unreachable code
    }

    // 4. Return inside a loop using repeat
    fun loopReturn(n: Int): Int {
        let sum = 0;
        repeat (n) {
            if (sum > 50) {
                return sum; // early exit if condition met
            }
            sum += 5;
        }
        return sum;
    }

    // 5. Multiple return paths with complex expressions
    fun multiplePaths(a: Int): Int {
        if (a == 0) {
            return 0;
        } else if (a < 0) {
            return -a;
        } else {
            return a * a;
        }
    }

    // 6. Getter with an early return in a conditional branch
    get fun getterConditional(): Int {
        if (now() % 2 == 0) {
            return 100;
        }
        return 200;
    }

    // 7. Getter that returns a tuple via a struct
    get fun getterTuple(): Tuple2 {
        if (now() % 2 == 0) {
            return Tuple2 { first: 10, second: 20 };
        } else {
            return Tuple2 { first: 30, second: 40 };
        }
    }

    // 8. Receiver function that uses return
    receive(msg: Message) {
        // For illustration, early return in a receiver
        if (msg.isEmpty) {
            return;
        }
        {
            let processed = true;
            if (processed) {
                return;
            }
        }
        // further processing if needed
    }

    // 9. Getter with nested blocks and conditional return from nested block
    get fun complexGetter(flag: Bool): Int {
        if (flag) {
            return 1;
        } else {
            {
                let inner = 0;
                if (inner > 1) {
                    return inner;
                }
            }
        }
        return 0;
    }
}
