struct Tuple2 { a: Int; b: Int; }

contract ReturnTest {
    v: Int = 10;
    
    // Basic function with conditional early return
    fun basic_return(x: Int): Int {
        if (x > 0) {
            return x;
        }
        return -x;
    }
    
    // Nested blocks with conditional return
    fun nested_return(cond: Bool): Int {
        if (cond) {
            { { return 42; } }
        }
        return 0;
    }
    
    // Return from within a loop using repeat
    fun loop_return(): Int {
        let i: Int = 0;
        repeat (5) {
            if (i == 2) {
                return i;
            }
            i = i + 1;
        }
        return -1;
    }
    
    // Getter returning a tuple-like value using a struct
    get fun tuple_getter(): Tuple2 {
        if (self.v < 5) {
            return Tuple2 { a: self.v, b: self.v + 1 };
        } else {
            return Tuple2 { a: 0, b: 0 };
        }
    }
    
    // Function returning an optional integer
    fun optional_return(x: Int): Int? {
        if (x % 2 == 0) {
            return x;
        }
        return null;
    }
    
    // Testing implicit fallthrough and explicit return
    fun implicit_return(x: Int): Int {
        if (x > 10) {
            return x;
        } else {
            { } // empty block, fallthrough
        }
        return 0;
    }
}
