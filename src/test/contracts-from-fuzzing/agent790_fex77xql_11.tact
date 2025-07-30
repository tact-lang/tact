contract MinimalWithNoConstInit {
    addr: Address;
    init() {
        self.addr = myAddress();
    }
}