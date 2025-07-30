contract Test3 {
    x: Int = 100;
    receive() {}
    get fun getOptional(): Int? {
        if (self.x > 50) {
            return self.x;
        } else {
            return null;
        }
    }
}
