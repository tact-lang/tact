contract TestVoidReturn {
    // A void function: no return type specified, expected to execute side effects.
    fun doSomething() {
        // side effect call
        dump(42);
        return; // explicit return in a void function
    }

    // Regular function with proper conditional returns
    fun conditionalReturn(x: Int): Int {
        if (x > 0) {
            return x;
        } else {
            return -x;
        }
    }

    // Nested block return example
    fun nestedBlockReturn(x: Int): Int {
        {
            if (x == 0) {
                return 100;
            }
        }
        return 200;
    }

    // Getter modifying state and returning a value (modification won't persist as per docs)
    
    // Note: Getters that return a value must be declared with 'get fun'
    get fun getCounter(): Int {
        // Suppose self.counter exists; we simulate with a literal, as state persistency is not central here.
        // Although modifying state in a getter doesn't persist.
        let counter = 10;
        // pretend to update but only return a computed value:
        return counter + 1;
    }

    // Receiver functions are not allowed to return a value
    // This snippet should cause a compilation error if uncommented, hence commented out:
    //
    // receive() {
    //     return 42; // Not allowed: receiver must return void
    // }
}
