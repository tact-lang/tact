contract AddressOptional {
    who: Address?;

    init() {
        self.who = null;
    }
}
