/// Test 9: Using initOf in a non-initializer (regular function) within the same contract

contract SelfCaller {
    fun callInit() : Cell {
       // Using initOf within a non-init function to obtain the current contract's init package
       let s: StateInit = initOf SelfCaller();
       return s.code;
    }

    init() {
        // Standard initializer
    }
}

contract EntryPoint {
    init() {
        let _ = initOf SelfCaller();
    }
}
