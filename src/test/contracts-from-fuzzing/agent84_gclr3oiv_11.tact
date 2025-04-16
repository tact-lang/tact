contract TestNestedReturn2 {
    fun f(x: Int): Int {
        {
            // First nested block
            if (x < 0) {
                return -x;
            }
            {
                // Further nested block
                if (x == 0) {
                    return 0;
                }
            }
        }
        return x;
    }
    
    receive() {}
}

contract TestGetterOptional {
    // Getter function returning an optional Int
    get fun getValue(x: Int): Int? {
        if (x > 0) {
            return x;
        } else {
            return null;
        }
    }
    
    receive() {}
}

contract TestLoopReturn {
    fun f(limit: Int): Int {
        let result: Int = 0;
        repeat (limit) {
            if (result >= 3) {
                return result;
            }
            // update result in a nested block
            {
                let temp = result + 1;
                result = temp;
            }
        }
        return result;
    }
    
    receive() {}
}
