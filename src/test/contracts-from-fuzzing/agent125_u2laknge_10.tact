// Persistent optional address
contract OptionalAddress {
    owner: Address?;

    init() {
        self.owner = null;
    }
}