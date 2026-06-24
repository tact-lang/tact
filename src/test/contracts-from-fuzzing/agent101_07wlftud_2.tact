contract ValidContract {
    state: Int = 42;
    
    init() {}
    
    receive() {
        // Correct usage: obtaining the initial state and code cell
        let s = initOf ValidContract();
        let c = codeOf ValidContract;
    }
}
