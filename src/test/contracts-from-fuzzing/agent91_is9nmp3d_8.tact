contract ReturnFuzzExperiment {
    receive() {}

    // Simple explicit return function
    fun simpleReturn(): Int {
        return 42;
    }

    // Conditional return with if-else
    fun conditionalReturn(flag: Bool): Int {
        if (flag) {
            return 10;
        } else {
            return -10;
        }
    }

    // Nested block with early return
    fun nestedBlockReturn(x: Int): Int {
        {
            if (x == 0) {
                return 100;
            }
        }
        return x * 2;
    }

    // Block assignment: using a block statement to perform an assignment
    fun blockAssignmentReturn(): Int {
        let result: Int = 0;
        {
            result = 5;
        }
        return result;
    }

    // Complex return: return inside an else block that contains a nested block
    fun complexReturn(cond: Bool): Int {
        if (cond) {
            return 200;
        } else {
            {
                return 300;
            }
        }
    }
}
