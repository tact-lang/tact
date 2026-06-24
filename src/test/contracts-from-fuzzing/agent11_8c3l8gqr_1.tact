contract Simple {
    init() {}
    receive() {
        let s: StateInit = initOf Simple();
        let addr = contractAddress(s);
    }
}
