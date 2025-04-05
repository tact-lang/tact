contract TestConstReceiver {
    const B: Int = 456;
    
    receive() {
        if (self.B == 456) {
            // condition true
        } else {
            // never reached
        }
    }
}
