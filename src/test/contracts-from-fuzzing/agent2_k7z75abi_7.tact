contract TestGetter {
    v: Int = 0;
    receive() {}

    // Getter function that modifies the state variable
    get fun test(): Int {
        self.v += 1; // modification will not persist
        return self.v;
    }
}
