contract TestGetterWrite {
    v: Int = 10;

    receive() {}

    // Getter function that attempts to increment state variable
    get fun getVandInc(): Int {
        self.v = self.v + 1;
        return self.v;
    }
}
