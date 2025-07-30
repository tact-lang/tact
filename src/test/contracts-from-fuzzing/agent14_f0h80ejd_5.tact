contract TestAddressStorage {
    // Persistent state variable declared using contract fields syntax. It must be given a default value.
    stored: Address = newAddress(0, 0);

    init() {
        self.stored = newAddress(0, 0xdeadbeef);
    }

    fun update() {
        self.stored = newAddress(0, 0xfeedface);
    }

    fun test() : Bool {
        self.update();
        return self.stored == newAddress(0, 0xfeedface);
    }
}
