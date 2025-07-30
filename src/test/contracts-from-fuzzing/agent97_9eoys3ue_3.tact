contract Test {
    x: Int = 42;

    // Getter function returning a primitive Int
    get fun getX(): Int {
        return self.x;
    }

    // Dummy receive function for contract compilation
    receive() { }
}