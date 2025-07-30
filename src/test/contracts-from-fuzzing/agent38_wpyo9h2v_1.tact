contract Test {
    // State variable
    v: Int = 42;

    // Normal receive function
    receive() {}

    // Getter function returning an Int
    get fun getV(): Int {
        return self.v;
    }
}
