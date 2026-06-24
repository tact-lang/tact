contract TryCatchReturn {
    receive() {}
    fun test(): Int {
        try {
            throw(101);
        } catch (e) {
            return e;
        }
    }
}

contract NestedTry {
    receive() {}
    fun test(): Int {
        try {
            try {
                throw(200);
            } catch (inner) {
                return inner;
            }
        } catch (outer) {
            return outer;
        }
    }
}

contract MixedFlow {
    receive() {}
    fun test(): Int {
        if (1 == 2) {
            return 0;
        } else {
            try {
                if (2 == 2) {
                    throw(77);
                }
                return 10;
            } catch (ex) {
                if (ex == 77) {
                    return 100;
                } else {
                    return 200;
                }
            }
        }
    }
}

contract LoopTry {
    receive() {}
    fun test(): Int {
        let sum: Int = 0;
        repeat (5) {
            try {
                if (sum > 2) {
                    return sum;
                }
                // Note: 'sum' is immutable so its value remains 0
            } catch (e) {
                // No action
            }
        }
        return sum;
    }
}

contract ThrowIfTest {
    receive() {}
    fun test(x: Int): Int {
        try {
            throwIf(400, x > 5);
        } catch (e) {
            return e;
        }
        return 0;
    }
}

contract ThrowUnlessTest {
    receive() {
        try {
            throwUnless(500, false);
        } catch (e) {
            return;
        }
        return;
    }
}

contract ReceiveTest {
    receive() {
        try {
            throw(300);
        } catch (e) {
            // Exception caught, proceed normally
        }
        return;
    }
}

contract ConditionalTry {
    receive() {}
    fun compute(x: Int): Int {
        try {
            if (x > 0) {
                return x * 2;
            }
        } catch (e) {
            return e;
        }
        return 0;
    }
}

contract ChainTry {
    receive() {}
    fun chain(): Int {
        try {
            throw(10);
        } catch (e) {
            try {
                if (e == 10) {
                    throw(20);
                }
            } catch (e2) {
                return e2;
            }
            return 30;
        }
    }
}
