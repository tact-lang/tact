contract Test {
    flag: Bool;
    count: Int;
    addr: Address;
    content: String;

    init() {
        self.flag = true;
        self.count = 0;
        self.addr = myAddress();
        self.content = "Hello";
    }
    
    receive() {
        // Dummy receiver to ensure compilation
    }
}