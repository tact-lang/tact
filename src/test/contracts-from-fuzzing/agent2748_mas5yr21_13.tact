contract WithAddressOptional {
    optAddr: Address?;

    init() {
        self.optAddr = null;
    }
}