contract OptionalAddressVar {
    addr: Address? = null;

    receive() {
        self.addr = myAddress();
    }
}