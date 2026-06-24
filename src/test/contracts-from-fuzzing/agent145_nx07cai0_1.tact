contract TestContract {
    init() {}
    
    // receiver to trigger compilation of initOf usage
    receive() {
        let s: StateInit = initOf TestContract();
    }
}
