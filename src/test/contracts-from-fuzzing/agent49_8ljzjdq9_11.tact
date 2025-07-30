contract Test {
    // Test default initialization of a state variable: Int defaults to 0
    x: Int = 0;

    receive() {}

    get fun getX(): Int {
        return self.x;
    }
}
