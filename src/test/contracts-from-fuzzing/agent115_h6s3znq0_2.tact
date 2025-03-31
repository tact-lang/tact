contract TestEmptyReceiver {
    x: Int = 0;
    
    receive() {
        self.x = 42;
    }
}
