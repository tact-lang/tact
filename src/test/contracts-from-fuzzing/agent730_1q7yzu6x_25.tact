contract InitInReceive {
    val: Int;
    
    init() {
        self.val = 0;
    }

    receive() {
        self.val = 10;
    }
}
