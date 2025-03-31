contract UnusedGetter {
    x: Int = 100;

    // Unused getter function
    get fun getUnused(): Int {
        return self.x;
    }

    receive() {}
}
