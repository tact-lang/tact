contract TestFallback {
    flag: Bool = false;

    // Fallback receiver for all binary messages
    receive(msg: Slice) {
        self.flag = true;
    }
}
