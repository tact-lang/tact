contract Tester {
    init() {}
    
    // Getter function that returns the code cell obtained from initOf
    get fun initCode(): Cell {
        let state = initOf Tester();
        return state.code;
    }
    
    // Internal function to demonstrate use of initOf in a normal function
    fun getStateData(): Cell {
        let state = initOf Tester();
        return state.data;
    }
    
    receive() {}
}
