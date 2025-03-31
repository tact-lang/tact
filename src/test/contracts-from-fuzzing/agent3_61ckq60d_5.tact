contract RequireTest {
    // Function that should pass the require check
    fun truePath(): Int {
        require(1 == 1, "all good");
        return 1;
    }
    
    // Function that fails the require check at runtime
    fun falsePath(): Int {
        require(1 == 2, "error message");
        return 0; // unreachable
    }
    
    // A simple receive function to allow contract deployment
    receive() {
        // do nothing
    }
    
    // Getter to test the truePath function
    get fun getTruePath(): Int {
        return self.truePath();
    }

    // Getter to test the falsePath function
    // Note: This getter when executed will trigger a runtime require failure.
    get fun getFalsePath(): Int {
        return self.falsePath();
    }
}
