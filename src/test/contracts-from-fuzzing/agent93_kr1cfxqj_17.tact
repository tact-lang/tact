contract TestNoSemicolonReturn {
    fun noSemicolonReturn(a: Int): Int {
         if (a > 10) { return a }  // no semicolon after return in the block, allowed
         return -a            // last statement, semicolon optional
    }
}

contract TestGetterReturn {
    v: Int = 0;
    
    // A getter that returns a value based on a condition
    get fun getDouble(): Int {
         if (self.v > 10) { return self.v * 2 }  // allowed: semicolon optional in block
         return self.v + 5
    }
}
