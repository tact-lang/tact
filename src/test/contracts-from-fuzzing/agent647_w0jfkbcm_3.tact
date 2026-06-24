contract TestContract {
    addressField: Address; // no default
    
    init() {
        self.addressField = myAddress();
    }
}