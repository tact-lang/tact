contract TestContract {
    addr: Address?;

    init() {
        self.addr = myAddress();
    }

    receive() {}
}