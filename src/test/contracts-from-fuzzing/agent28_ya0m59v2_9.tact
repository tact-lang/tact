contract FuzzReturnRecursion {
    
    // Recursive computation of factorial with multiple return paths
    fun factorial(n: Int): Int {
        if (n < 0) {
            return -1;
        } else if (n == 0) {
            return 1;
        } else {
            return n * self.factorial(n - 1);
        }
    }
    
    // A recursive function with nested blocks and returns
    fun recursiveNested(x: Int): Int {
        {
            if (x <= 1) {
                return 1;
            } else {
                {
                    let y = x - 1;
                    return x * self.recursiveNested(y);
                }
            }
        }
    }
    
    // Getter that returns a value computed via recursion
    get fun getterRec(): Int {
        return self.factorial(self.v);
    }
    
    // A state variable used by getterRec
    v: Int = 5;
    
    // Helper function to compute new accumulator value
    fun newAcc(acc: Int): Int {
         if (acc > 50) {
             return self.factorial(acc % 10);
         } else {
             return acc + 5;
         }
    }
    
    // Recursive accumulate function simulating a loop with early return behavior via recursion
    fun accumulate(acc: Int, count: Int, limit: Int): Int {
        if (count >= limit) {
            return acc;
        } else {
            return self.accumulate(self.newAcc(acc), count + 1, limit);
        }
    }
    
    // Function that simulates a loop using recursion
    fun loopAndRec(limit: Int): Int {
        return self.accumulate(0, 0, limit);
    }
}
