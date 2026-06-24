struct Pair { fst: Int; snd: Int; } 

contract TestReturnBehavior {
    value: Int = 10;
    
    // 1. Regular function with an early return
    fun earlyReturn(x: Int): Int {
        if (x > 0) {
            return 100;
        }
        return -100;
    }
    
    // 2. Function with a nested block containing a return
    fun nestedReturn(x: Int): Int {
        {
            if (x > 50) {
                return 50;
            }
        }
        return x;
    }
    
    // 3. Function using a loop (repeat) with an early return inside the loop block
    fun loopReturn(n: Int): Int {
        repeat (n) {
            if (n == 3) {
                return 3;
            }
        }
        return n;
    }
    
    // 4. Function demonstrating implicit return (standard if-else)
    fun implicitReturn(x: Int): Int {
        if (x == 0) {
            return 0;
        } else {
            return x * 2;
        }
    }
    
    // 5. Function with an optional return type
    fun maybeReturn(x: Int): Int? {
        if (x > 5) {
            return x;
        }
        return null;
    }
    
    // 6. Function with multiple return paths returning a Pair struct
    fun returnPair(x: Int): Pair {
        if (x > 10) {
            return Pair { fst: x, snd: x + 10 };
        } else {
            return Pair { fst: x, snd: x - 10 };
        }
    }
    
    // 7. Getter that returns a Pair struct
    get fun pairGetter(): Pair {
        if (self.value > 5) {
            return Pair { fst: self.value, snd: self.value + 1 };
        } else {
            return Pair { fst: self.value, snd: self.value - 1 };
        }
    }
    
    // 8. Receiver function with explicit returns
    receive() {
        if (self.value < 0) {
            return;
        }
        return;
    }
    
    // 9. Function simulating a loop with a return inside a repeat block
    fun whileReturn(x: Int): Int {
        repeat (x) {
            if (x == 5) {
                return 999;
            }
        }
        return 0;
    }
    
    // 10. Function with complex return logic using nested conditionals and loops
    fun complexReturn(x: Int): Int {
        if (x > 20) {
            repeat (x) {
                if (x % 2 == 0) {
                    return x / 2;
                }
            }
        } else {
            if (x < 0) {
                return -x;
            } else {
                return x;
            }
        }
        return 0;
    }
}
