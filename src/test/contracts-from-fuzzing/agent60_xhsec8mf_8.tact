contract TestFallback {
    flag: Int = 0;

    // Fallback receiver: catches all binary messages with unmatched type
    receive(msg: Slice) {
        self.flag = 5;
    }

    get fun trigger(): Int {
         return self.flag;
    }
}
