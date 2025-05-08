struct ReturnPair {
    first: Int;
    second: Int;
}

contract TestReturns {
    // Regular function with early returns and nested block
    fun regularReturn(a: Int): Int {
        if (a > 0) {
            return a;
        } else {
            {
                let msg: Int = a * 5;
                if (msg < -10) {
                    return msg;
                }
            }
            return 0;
        }
    }

    // Getter with conditional branches returning a complex struct
    get fun getterReturn(): ReturnPair {
        if (self.regularReturn(5) > 3) {
            return ReturnPair { first: 10, second: 20 };
        } else {
            return ReturnPair { first: 1, second: 2 };
        }
    }

    // Receiver function using return statement
    receive () {
        if (true) {
            return;
        }
    }

    // Function explicitly returning unit
    fun unitReturn() {
        return;
    }

    // Function returning an optional Int using a ternary expression
    fun optionalReturn(a: Int): Int? {
        return a > 0 ? a : null;
    }
}
