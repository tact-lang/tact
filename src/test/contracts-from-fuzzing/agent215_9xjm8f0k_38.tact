contract SelfReference {
    self_address: Address;

    init() {
        self.self_address = myAddress();
    }
}