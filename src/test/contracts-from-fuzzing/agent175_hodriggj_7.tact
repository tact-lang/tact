contract Test5 {
    res: Int = 0;

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.res = 999;
    }

    get fun getRes(): Int {
        return self.res;
    }
}
