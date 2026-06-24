contract OptionalAddr {
    owner: Address?;

    init() {
        self.owner = null;
    }
}