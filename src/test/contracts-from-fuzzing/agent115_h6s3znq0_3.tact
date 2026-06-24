contract TestLiteralReceiver {
    x: Int = 0;
    
    receive("hello") {
        self.x = 100;
    }
}
