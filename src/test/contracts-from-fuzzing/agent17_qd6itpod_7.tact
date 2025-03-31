contract G(x: Int) {
    // persistent state variable, declared using the contract fields syntax;
    // note that since we use contract parameters, we should not declare init()
    // Instead, we only use the parameter x
    // However, if we want to set an additional state variable, we can declare it and initialize it in init() if not using contract parameters syntax entirely.
    // Here, we demonstrate the use of contract parameters to initialize state, so no init() function is allowed.
    // Instead, we'll let x be the persistent state variable.
    
    // The contract's state is simply the parameter x
    // No further initialization needed
    receive() {}
}

contract H {
    // Returns the initial state of contract G with parameter 123
    fun getGInit() : StateInit {
        return initOf G(123);
    }
    receive() {}
}
