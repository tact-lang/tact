contract Test {
    x: Int = 123;

    receive() {}

    // Getter function returning a primitive Int value
    get fun getInt(): Int {
        return self.x;
    }
}
