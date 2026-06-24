contract TestContract {
    init() {}
    
    receive() {
        let initState = initOf TestContract();
        let code = codeOf TestContract;
        if (myCode() == code) { return; }
    }
}
