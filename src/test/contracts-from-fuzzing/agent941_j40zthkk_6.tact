contract OptionalAddressField {
    addr: Address? = null;

    receive() {
        self.addr = null;
    }
}