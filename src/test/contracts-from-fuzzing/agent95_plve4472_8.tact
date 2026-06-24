contract TestGetterDeepReturn {
    // Initialize field v
    v: Int = 75;
    receive() {}
    get fun deep(): Int {
        if (self.v > 50) {
            repeat (2) {
                if (self.v > 100) {
                    return self.v - 50;
                }
            }
            return self.v;
        } else {
            return 0;
        }
    }
}
