contract Test1 {
    flag: Bool = false;

    // Receiver for specific text comment "hello"
    receive("hello") {
        self.flag = true;
    }
}
