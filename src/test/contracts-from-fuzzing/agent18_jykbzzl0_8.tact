contract Test {
    receive() {}
    
    // Getter function attempting to call sender(), which is undefined in getters
    get fun callSender(): Int {
        let s = sender();
        return 0;
    }
}
