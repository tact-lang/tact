trait T1 {
    // Provides a default implementation returning 10
    fun foo(): Int { return 10; }
}

trait T2 {
    // Provides another method returning 5
    fun bar(): Int { return 5; }
}

trait T3 {
    // Abstract method to be implemented by a contract
    abstract fun baz(): Int;
    
    // Concrete method that adds 100 to the result of baz()
    fun compute(): Int {
        return self.baz() + 100;
    }
}

contract Test() with T1, T2, T3 {
    // Override the abstract method from T3
    override fun baz(): Int {
        return 20;
    }
    
    receive() {
        // Expect T1.foo() to return 10
        let a = self.foo();
        // Expect T3.compute() to return 20 + 100 = 120
        let b = self.compute();
        require(a == 10, "T1.foo() did not return 10");
        require(b == 120, "T3.compute() incorrect");
    }
}

trait T4 {
    // Provides a method named conflicted
    fun conflicted(): Int { return 1; }
}

trait T5 {
    // Also provides a method named conflicted
    fun conflicted(): Int { return 2; }
}

contract Test2() with T4, T5 {
    // Resolve the conflict by overriding the conflicted() method
    override fun conflicted(): Int {
        return 42;
    }
    
    receive() {
        let x = self.conflicted();
        require(x == 42, "Unexpected conflicted result");
    }
}
