struct Pair {
    first: Int;
    second: Int;
}

contract ReturnComplexFlow2 {
    // Function with multiple nested return paths
    fun testFlow(a: Int, flag: Bool): Pair? {
        if (flag) {
            if (a > 10) {
                return Pair { first: a, second: a + 1 };
            } else {
                {
                    let b = a * 2;
                    if (b == 0) {
                        return null;
                    }
                    return Pair { first: b, second: b + 2 };
                }
            }
        } else {
            repeat (a) {
                if (a % 3 == 0) {
                    return Pair { first: a, second: a - 3 };
                }
            }
            return Pair { first: a, second: a };
        }
    }

    // Receiver function with branch returns
    receive () {
        if (self.flagFun()) {
            return;
        } else {
            return;
        }
    }

    // A helper function used in the receiver
    fun flagFun(): Bool {
        return true;
    }
}
