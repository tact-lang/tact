// Snippet A: Using '_' as a valid discard in a normal function parameter
contract TestA {
    // Function f uses a discard parameter for its argument
    fun f(_: Int): Int { return 42; }
    
    receive() { 
        let res = self.f(10);
    }
}
