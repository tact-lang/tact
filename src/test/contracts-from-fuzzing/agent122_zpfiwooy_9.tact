contract TestReturnAdvanced {
    // Function with nested conditional returns
    fun nestedConditionalReturn(x: Int, y: Int): Int {
        if (x > y) { 
            return x - y; 
        } else {
            if (x == y) { 
                return 0; 
            } else { 
                return y - x; 
            }
        }
    }

    // Function returning an optional Int based on a condition
    fun conditionalOptionalReturn(flag: Bool): Int? {
        if (flag) { 
            return 101;
        } else { 
            return null;
        }
    }

    // Getter with a simple conditional return (semicolons omitted where allowed)
    get fun getterConditional(): Int {
        if (true) { return 202 } 
        return 303
    }

    // Receiver: must not return any value
    receive() {
        return;
    }

    // Function testing return inside a repeat loop
    fun loopReturnTest(): Int {
        repeat (5) {
            if (true) { return 555; }
        }
        return 0;
    }
}
