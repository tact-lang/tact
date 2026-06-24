contract Test3 {
    value: Int = 7;

    receive() {}

    get fun getOptional(): Int? {
        if (self.value > 10) {
            return self.value;
        } else {
            return null;
        }
    }
}
